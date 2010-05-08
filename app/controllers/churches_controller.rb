class ChurchesController < ApplicationController
  before_filter :authorize
  def index
    @churches = Church.find(:all, :conditions => ['name LIKE ?', "%#{params[:search]}%"])
  end
end
