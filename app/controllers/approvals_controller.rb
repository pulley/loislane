class ApprovalsController < ApplicationController
  before_filter :setup_commit

  # GET /commits/1/approvals/new
  # GET /commits/1/approvals/new.xml
  def new
    @approval = Approval.new(:user => current_user, :commit => @commit)

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @approval }
    end
  end

  # POST /commits/1/approvals
  # POST /commits/1/approvals.xml
  def create
    @approval = Approval.new(params[:approval])
    @approval.user = current_user
    @approval.commit = @commit

    respond_to do |format|
      if @approval.save
        format.html { redirect_to(@approval, :notice => 'Approval was successfully created.') }
        format.xml  { render :xml => @approval, :status => :created, :location => @approval }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @approval.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /commits/1/approvals/1
  # DELETE /commits/1/approvals/1.xml
  def destroy
    @approval = Approval.find(params[:id])
    @approval.destroy

    respond_to do |format|
      format.html { redirect_to(approvals_url) }
      format.xml  { head :ok }
    end
  end

private

  def setup_commit
    @commit = Commit.find(params[:commit_id])
  end
end
