class PointsController < ApplicationController
  # GET /points
  # GET /points.xml
  def index
    @today = Date.today
    @teams = Team.all
    @points = Point.find_by_day(@today)
    @points.each do |point|
      if @teams.include?(point.team)
        @teams -= point.team
      end
      
      unless @teams.blank?
        @teams.each do |team|
          team.points.create(:day => @today)
        end
      end
    end
    @points = Point.find_by_day(@today)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @points }
    end
  end

  # GET /points/1
  # GET /points/1.xml
  def show
    @point = Point.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @point }
    end
  end

  # GET /points/new
  # GET /points/new.xml
  def new
    @point = Point.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @point }
    end
  end

  # GET /points/1/edit
  def edit
    @point = Point.find(params[:id])
  end

  # POST /points
  # POST /points.xml
  def create
    @point = Point.new(params[:point])

    respond_to do |format|
      if @point.save
        flash[:notice] = 'Point was successfully created.'
        format.html { redirect_to(@point) }
        format.xml  { render :xml => @point, :status => :created, :location => @point }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @point.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /points/1
  # PUT /points/1.xml
  def update
    @point = Point.find(params[:id])

    respond_to do |format|
      if @point.update_attributes(params[:point])
        flash[:notice] = 'Point was successfully updated.'
        format.html { redirect_to(@point) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @point.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /points/1
  # DELETE /points/1.xml
  def destroy
    @point = Point.find(params[:id])
    @point.destroy

    respond_to do |format|
      format.html { redirect_to(points_url) }
      format.xml  { head :ok }
    end
  end
end
