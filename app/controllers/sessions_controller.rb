class SessionsController < ApplicationController
  layout 'minimal'

  skip_before_filter :authenticate_user!

  # GET /sessions/new
  def new
  end

  # POST /sessions
  def create
    user = User.authenticate(params[:username], params[:password])

    if user
      session[:user_id] = user.id
      redirect_to root_url, :notice => "Welcome, #{user.email}, you're now logged in."
    else
      flash.now.alert = "Invalid username or password!"
      render :new
    end
  end

  # DELETE /sessions/1
  def destroy
    session[:user_id] = nil
    redirect_to login_path, :notice => "Thanks! You're now logged out."
  end
end
