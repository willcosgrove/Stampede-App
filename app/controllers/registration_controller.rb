class RegistrationController < ApplicationController

  def index
    @teams = Team.find(:all)
    @stampeder = Stampeder.new
  end

  def signin
    @stampeder = Stampeder.new
  end
  
  def register_stampeder
    @stampeder = Stampeder.new(params[:stampeder])
    @stampeder.save
  end
  
  def add_barcode
    @stampeder = Stampeder.find(params[:id])
    @stampeder.update_attribute(:barcode, params[:barcode])
    @stampeder.signins.create( :day_signed_in => Time.now )
    @lastSignedInStampeder = @stampeder
    @stampeder = Stampeder.new
    #respond_to do |format|
      #if @stampeder.update_attribute(:barcode, params[:barcode]) && @stampeder.signins.create( :day_signed_in => Time.now )
      #  format.html { redircet_to(registration_signin_path) }
      #else
      #  flash[:error] = "Unable to add the barcode or something"
      #end
  end
  
  def fill_in
    @stampeders = Stampeder.find(:all, :order => "lastname").select { |stampeder| stampeder.missingInfo? }
    if @stampeders.size > 1
      @plural = true
    else
      @plural = false
    end
  end

end
