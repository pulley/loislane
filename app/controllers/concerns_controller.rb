class ConcernsController < ApplicationController
  # GET /concerns
  # GET /concerns.xml
  def index
    @concerns = Concern.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @concerns }
    end
  end

  # GET /concerns/1
  # GET /concerns/1.xml
  def show
    @concern = Concern.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @concern }
    end
  end

  # GET /concerns/new
  # GET /concerns/new.xml
  def new
    @concern = Concern.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @concern }
    end
  end

  # GET /concerns/1/edit
  def edit
    @concern = Concern.find(params[:id])
  end

  # POST /concerns
  # POST /concerns.xml
  def create
    @concern = Concern.new(params[:concern])

    respond_to do |format|
      if @concern.save
        format.html { redirect_to(@concern, :notice => 'Concern was successfully created.') }
        format.xml  { render :xml => @concern, :status => :created, :location => @concern }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @concern.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /concerns/1
  # PUT /concerns/1.xml
  def update
    @concern = Concern.find(params[:id])

    respond_to do |format|
      if @concern.update_attributes(params[:concern])
        format.html { redirect_to(@concern, :notice => 'Concern was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @concern.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /concerns/1
  # DELETE /concerns/1.xml
  def destroy
    @concern = Concern.find(params[:id])
    @concern.destroy

    respond_to do |format|
      format.html { redirect_to(concerns_url) }
      format.xml  { head :ok }
    end
  end
end
