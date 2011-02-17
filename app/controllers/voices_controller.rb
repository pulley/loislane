class VoicesController < ApplicationController
  before_filter :setup_commit

  # POST /commits/1/voices
  def create
    @voice = Voice.new(params[:voice])
    @voice.user = current_user
    @voice.commit = @commit

    if @voice.save
      render :partial => "shared/bubble", :locals => {:bubble => @voice, :bubble_counter => (@commit.voices.count + 1)}, :status => :created, :layout => false
    else
      render :json => @voice.errors, :status => :unprocessable_entity
    end
  end

  # DELETE /commits/1/voices/1
  def destroy
    @voice = Voice.find(params[:id])
    @voice.destroy

    render :json => { :success => true, :message => "Destroyed Voice #{@voice.id}" }
  end

  private

    def setup_commit
      @commit = Commit.find(params[:commit_id])
    end
end
