class NavigationController < ApplicationController
  before_filter :authorize
  def index
    @date = Date.today
  end

end
