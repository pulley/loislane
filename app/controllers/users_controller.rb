class UsersController < ApplicationController
  before_filter :set_current_user

  # GET /profile
  def edit
  end

  def update
    if @user.update_attributes(params[:user])
      redirect_to root_path, :notice => 'Your profile has been successfully updated.'
    else
      flash.now.alert = "Something went wrong updating your profile!"
      render :action => "edit"
    end
  end

  def destroy
    @user.destroy

    redirect_to root_path, :notice => 'Oh no! We hate to see you go.'
  end

  private

    def set_current_user
      @user = current_user
    end
end
