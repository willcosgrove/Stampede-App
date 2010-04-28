class PublicController < ApplicationController

  def index
    
  end
  
  def sign_up
    @stampeder = Stampeder.new
  end
  
  def register
    @stampeder = Stampeder.new(params[:stampeder])
    @stampeder.online_signup = true
    @stampeder.save
  end

end
