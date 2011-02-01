class CommitsController < ApplicationController
  before_filter :verify_ownership, :only => [:edit, :update, :destroy]

  # GET /commits
  # GET /commits.xml
  def index
    @commits = Commit.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @commits }
    end
  end

  # GET /commits/1
  # GET /commits/1.xml
  def show
    @commit = Commit.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @commit }
    end
  end

  # GET /commits/new
  # GET /commits/new.xml
  def new
    @commit = Commit.new
    @commit.user = current_user

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @commit }
    end
  end

  # GET /commits/1/edit
  def edit
  end

  # POST /commits
  # POST /commits.xml
  def create
    @commit = Commit.new(params[:commit])
    @commit.user = current_user

    respond_to do |format|
      if @commit.save
        format.html { redirect_to([current_user, @commit], :notice => 'Commit was successfully created.') }
        format.xml  { render :xml => @commit, :status => :created, :location => [current_user, @commit] }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @commit.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /commits/1
  # PUT /commits/1.xml
  def update
    respond_to do |format|
      if @commit.update_attributes(params[:commit])
        format.html { redirect_to([@commit.user, @commit], :notice => 'Commit was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @commit.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /commits/1
  # DELETE /commits/1.xml
  def destroy
    @commit.destroy

    respond_to do |format|
      format.html { redirect_to(commits_url) }
      format.xml  { head :ok }
    end
  end

private

  def verify_ownership
    @commit = Commit.find(params[:id])

    if current_user != @commit.user
      flash.now.alert = "Sorry, this isn't your commit!"
      return false
    end
  end
end
