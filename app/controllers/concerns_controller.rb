class ConcernsController < ApplicationController
  before_filter :setup_commit

  # GET /concerns/new
  # GET /concerns/new.xml
  def new
    @concern = Concern.new(:user => current_user, :commit => @commit)

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @concern }
    end
  end

  # POST /concerns
  # POST /concerns.xml
  def create
    @concern = Concern.new(params[:concern])
    @concern.user = current_user
    @concern.commit = @commit

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

private

  def setup_commit
    @commit = Commit.find(params[:commit_id])
  end
end
