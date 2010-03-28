class StampedersController < ApplicationController
  
  # GET /stampeders
  # GET /stampeders.xml
  def index
    @stampeders = Stampeder.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @stampeders }
    end
  end

  # GET /stampeders/1
  # GET /stampeders/1.xml
  def show
    @stampeder = Stampeder.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @stampeder }
    end
  end

  # GET /stampeders/new
  # GET /stampeders/new.xml
  def new
    @teams = Team.find(:all)
    @stampeder = Stampeder.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @stampeder }
    end
  end

  # GET /stampeders/1/edit
  def edit
    @teams = Team.find(:all)
    @stampeder = Stampeder.find(params[:id])
  end

  # POST /stampeders
  # POST /stampeders.xml
  def create
    @stampeder = Stampeder.new(params[:stampeder])
    
    respond_to do |format|
      if @stampeder.save
        flash[:notice] = 'Stampeder was successfully created.'
        format.html { redirect_to(@stampeder) }
        format.xml  { render :xml => @stampeder, :status => :created, :location => @stampeder }
      else
        @teams = Team.find(:all)
        format.html { render :action => "new" }
        format.xml  { render :xml => @stampeder.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /stampeders/1
  # PUT /stampeders/1.xml
  def update
    @stampeder = Stampeder.find(params[:id])
    @stampeder.parentphone.gsub!(/\D/, "")

    respond_to do |format|
      if @stampeder.update_attributes(params[:stampeder])
        flash[:notice] = 'Stampeder was successfully updated.'
        format.html { redirect_to :back }
        format.xml  { head :ok }
      else
        @teams = Team.find(:all)
        format.html { render :action => "edit" }
        format.xml  { render :xml => @stampeder.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /stampeders/1
  # DELETE /stampeders/1.xml
  def destroy
    @stampeder = Stampeder.find(params[:id])
    @stampeder.destroy

    respond_to do |format|
      format.html { redirect_to(stampeders_url) }
      format.xml  { head :ok }
    end
  end
  
  def registration
    @teams = Team.find(:all)
    @stampeder = Stampeder.new
  end
  
  def autocomplete
    @stampeders = Stampeder.find(:all, :conditions => ['fullname LIKE ?', "%#{params[:search]}%"])
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def signin
    @stampeder = Stampeder.new
  end
  
  def register_stampeder
    @stampeder = Stampeder.new(params[:stampeder])
    @stampeder.save
  end
  
  def add_barcode
    @stampeder = Stampeder.find(params[:id])
    @stampeder.update_attribute(:barcode, params[:barcode])
    @stampeder.signins.create( :day_signed_in => Time.now )
    @lastSignedInStampeder = @stampeder
    @stampeder = Stampeder.new
    #respond_to do |format|
      #if @stampeder.update_attribute(:barcode, params[:barcode]) && @stampeder.signins.create( :day_signed_in => Time.now )
      #  format.html { redircet_to(registration_signin_path) }
      #else
      #  flash[:error] = "Unable to add the barcode or something"
      #end
  end
  
  def fill_in
    @stampeders = Stampeder.find(:all, :order => "lastname").select { |stampeder| stampeder.missingInfo? }
    if @stampeders.size > 1
      @plural = true
    else
      @plural = false
    end
  end
   
end
