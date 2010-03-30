class SigninsController < ApplicationController
  def create
    @stampeder = Stampeder.find_by_barcode(params[:barcode])
    Signin.create(:stampeder_id => @stampeder.id, :day_signed_in => Time.now)
    render :update do |page|
      page.replace_html 'just_signed_in', "#{@stampeder.fullname}"
      page[:signin_flash].visual_effect :appear
      page[:signin_flash].visual_effect :fade, :duration => 5
    end
  end

end
