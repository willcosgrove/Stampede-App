class SchoolsController < ApplicationController
  before_filter :authorize
  def index
    @schools = School.find(:all, :conditions => ['name LIKE ?', "%#{params[:search]}%"])
  end
end
