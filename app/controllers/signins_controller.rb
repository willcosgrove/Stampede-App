class SigninsController < ApplicationController

  def create
    @stampeder = Stampeder.find_by_id(params[:id])
    Signin.create(:stampeder_id => @stampeder.id, :day_signed_in => Time.now)
    @justSignedIn = @stampeder
    @stampeder = Stampeder.new
  end
  
  def confirm
    @stampeder = Stampeder.find_by_barcode(params[:barcode])
  end

end