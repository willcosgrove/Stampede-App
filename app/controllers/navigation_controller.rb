class NavigationController < ApplicationController
  before_filter :authorize
  def index
    @date = Date.today
  end
  
  def search
    unless params[:query].blank?
      @stampeders = Stampeder.find(:all, :conditions => ['fullname LIKE ?', "%#{params[:query]}%"], :include => [:team, :stampeder])
      unless @stampeders.blank?
        render :update do |page|
          page.replace_html 'results', :partial => 'results', :object => @stampeders
          page.visual_effect :appear, 'results', :duration => 0.25
        end
      else
        render :update do |page|
          page.visual_effect :fade, 'results', :duration => 0.25
        end
      end
    end
  end

end
