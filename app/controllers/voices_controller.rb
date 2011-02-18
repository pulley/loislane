class VoicesController < ApplicationController
  before_filter :verify_ownership, :only => [:destroy]

  # POST /commits/1/voices
  def create
    @commit = Commit.find(params[:commit_id])

    @voice = Voice.new(params[:voice])
    @voice.user = current_user
    @voice.commit = @commit
    @voice.save

    render :format => :js
  end

  # DELETE /commits/1/voices/1
  def destroy
    @voice = Voice.find(params[:id])

    @voice.destroy

    render :format => :js
  end

  private

    def verify_ownership
      @voice = Voice.find(params[:id])

      if @voice.blank? || current_user != @voice.user
        return false
      else
        return true
      end
    end
end
