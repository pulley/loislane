class VoicesController < ApplicationController
  respond_to :js

  before_filter :setup_commit

  # POST /commits/1/voices
  def create
    @voice = Voice.new(params[:voice])
    @voice.user = current_user
    @voice.commit = @commit
    @voice.save
    respond_with @voice
  end

  # DELETE /commits/1/voices/1
  def destroy
    @voice = Voice.find(params[:id])
    @voice.destroy

    respond_with @voice
  end

  private

    def setup_commit
      @commit = Commit.find(params[:commit_id])
    end
end
