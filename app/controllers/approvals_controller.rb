class ApprovalsController < ApplicationController
  before_filter :setup_commit

  # GET /commits/1/approvals/new
  def new
    @approval = Approval.new(:user => current_user, :commit => @commit)
  end

  # POST /commits/1/approvals
  def create
    @approval = Approval.new(params[:approval])
    @approval.user = current_user
    @approval.commit = @commit

    if @approval.save
      redirect_to @commit, :notice => 'Approval was successfully created.'
    else
      render :action => "new"
    end
  end

  # DELETE /commits/1/approvals/1
  def destroy
    @approval = Approval.find(params[:id])
    @approval.destroy

    redirect_to @commit
  end

private

  def setup_commit
    @commit = Commit.find(params[:commit_id])
  end
end
