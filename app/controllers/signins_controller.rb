class SigninsController < ApplicationController
  def create
    @stampeder = Stampeder.find_by_barcode(params[:barcode])
    Signin.create(:stampeder_id => @stampeder.id, :day_signed_in => Time.now)
  end

end
