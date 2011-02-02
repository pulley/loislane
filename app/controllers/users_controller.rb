class UsersController < ApplicationController
  before_filter :set_current_user

  # GET /profile
  def edit
  end

  def update
    if @user.update_attributes(params[:user])
      redirect_to root_path, :notice => 'User was successfully updated.'
    else
      render :action => "edit"
    end
  end

  def destroy
    @user.destroy

    redirect_to root_path
  end

private

  def set_current_user
    @user = current_user
  end
end
