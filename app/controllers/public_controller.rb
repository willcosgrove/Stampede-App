class PublicController < ApplicationController
  
  def index
  end
  
  def sign_up
    @stampeder = Stampeder.new
    @mmbc = Church.find_by_name("McKinney Memorial Bible Church")
    @friend = Stampeder.find_by_id(params[:referral_code].to_i / REFERRAL_CONSTANT)
  end
  
  def register
    #debugger
    @stampeder = Stampeder.new(params[:stampeder])
    if params[:referral_code].match(/\A\D*\Z/)
      @stampeder.notes = params[:referral_code]
    else
      @stampeder.friend_id = params[:referral_code].to_i / REFERRAL_CONSTANT unless params[:referral_code] == "" || @stampeder.church == Church.find_by_name("McKinney Memorial Bible Church")
    end
    @stampeder.online_signup = true
    @stampeder.textmsg = false if @stampeder.textmsg.nil?
    
    respond_to do |format|
      if @stampeder.save
        Notifier.deliver_welcome_letter(@stampeder)
        Notifier.deliver_information_letter(@stampeder)
        Twilio.connect(TWILIO_SID, TWILIO_AUTH_TOKEN)
        Twilio::Sms.message('8173304437', @stampeder.studentphone, "Hey, thanks for signing up for Stampede!  Tell all of your friends to sign up with your friend code: #{@stampeder.referral_code}") if @stampeder.textmsg
        flash[:notice] = "You have been signed up!"
        format.html { render :action => "registered", :id => @stampeder.id }
        format.xml  { render :xml => @stampeder, :status => :created, :location => @stampeder }
      else
        @mmbc = Church.find_by_name("McKinney Memorial Bible Church")
        @friend = Stampeder.find_by_id(params[:referral_code].to_i / REFERRAL_CONSTANT)
        format.html { render :action => "sign_up" }
        format.xml  { render :xml => @stampeder.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def registered
    require 'cgi'
    @stampeder = Stampeder.find_by_id(params[:id])
  end
  
  def referral_lookup
    @f = Stampeder.find_by_id(params[:q].to_f / REFERRAL_CONSTANT)
    render :update do |page|
      if @f
        page.replace_html "referral_lookup", "<span style='color:green;' class='note'>(#{@f.fullname})</span>"
      else
        page.replace_html "referral_lookup", "<span style='color:red;' class='note'>You can type in your friend's name<br />if you don't know their friend code.</span>"
      end
    end
  end

end
