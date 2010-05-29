class RegistrationController < ApplicationController
  before_filter :authorize
  
  def index
    @teams = Team.find(:all)
    @stampeder = Stampeder.new
  end

  def signin
    @stampeder = Stampeder.new
    if params[:query].blank?
      @stampeders = []
    else
      @stampeders = Stampeder.find(:all, :conditions => ['fullname LIKE ?', "%#{params[:query]}%"], :include => [:team, :stampeder]) unless params[:query].blank?
    end
  end
  
  def search
    unless params[:query].blank?
      @stampeders = Stampeder.find(:all, :conditions => ['fullname LIKE ?', "%#{params[:query]}%"], :include => [:team, :stampeder])
      unless @stampeders.blank?
        render :update do |page|
          page.replace_html 'results', :partial => @stampeders
          page.visual_effect :appear, 'results', :duration => 0.25
        end
      else
        render :update do |page|
          page.visual_effect :fade, 'results', :duration => 0.25
        end
      end
    end
  end
  
  def register_stampeder
    @stampeder = Stampeder.new(params[:stampeder])
    @stampeder.online_signup = false
    @stampeder.save
    Signin.create(:stampeder_id => @stampeder.id, :day_signed_in => Time.now)
    @justSignedIn = @stampeder
    @stampeder = Stampeder.new
  end
  
  def fill_in
    @stampeders = Stampeder.find(:all, :order => "lastname").select { |stampeder| stampeder.missingInfo? }
    if @stampeders.size > 1
      @plural = true
    else
      @plural = false
    end
  end
  
  def view_all
    @t1Stampeders = Stampeder.find_all_by_team_id(1, :order => "lastname")
    @t2Stampeders = Stampeder.find_all_by_team_id(2, :order => "lastname")
    @t3Stampeders = Stampeder.find_all_by_team_id(3, :order => "lastname")
    @t4Stampeders = Stampeder.find_all_by_team_id(4, :order => "lastname")
    @stampeders = Stampeder.paginate :order => "lastname", :page => params[:page]
    @teams = Team.all
  end

end
