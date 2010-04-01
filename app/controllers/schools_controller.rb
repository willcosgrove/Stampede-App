class SchoolsController < ApplicationController

  def index
    @schools = School.find(:all, :conditions => ['name LIKE ?', "%#{params[:search]}%"])
  end

end
