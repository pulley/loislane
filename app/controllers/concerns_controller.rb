class ConcernsController < ApplicationController
  before_filter :setup_commit

  # GET /concerns/new
  def new
    @concern = Concern.new(:user => current_user, :commit => @commit)
  end

  # POST /concerns
  def create
    @concern = Concern.new(params[:concern])
    @concern.user = current_user
    @concern.commit = @commit

    if @concern.save
      redirect_to @commit, :notice => 'Concern was successfully created.'
    else
      render :action => "new"
    end
  end

  # DELETE /concerns/1
  def destroy
    @concern = Concern.find(params[:id])
    @concern.destroy

    redirect_to concerns_path
  end

private

  def setup_commit
    @commit = Commit.find(params[:commit_id])
  end
end
