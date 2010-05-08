class PublicController < ApplicationController
  before_filter :authorize
  
  def index
    
  end
  
  def sign_up
    @stampeder = Stampeder.new
    @mmbc = Church.find_by_name("McKinney Memorial Bible Church")
  end
  
  def register
    debugger
    @stampeder = Stampeder.new(params[:stampeder])
    @stampeder.friend_id = params[:'referral number'] / REFERRAL_CONSTANT unless params[:'referral number'] == ""
    @stampeder.online_signup = true
    
    respond_to do |format|
      if @stampeder.save
        flash[:notice] = "You have been signed up!"
        format.html { render :action => "index" }
        format.xml  { render :xml => @stampeder, :status => :created, :location => @stampeder }
      else
        format.html { render :action => "sign_up" }
        format.xml  { render :xml => @stampeder.errors, :status => :unprocessable_entity }
      end
    end
  end

end
