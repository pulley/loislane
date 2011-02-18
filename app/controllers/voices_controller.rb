class VoicesController < ApplicationController
  respond_to :js

  # POST /commits/1/voices
  def create
    @commit = Commit.find(params[:commit_id])

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
end
