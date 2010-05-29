class ChurchesController < ApplicationController
  def index
    @churches = Church.find(:all, :conditions => ['name LIKE ?', "%#{params[:search]}%"])
  end
end
