class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authenticate_user!

  private

    # Used as a :before_filter to redirect requests without current_user
    def authenticate_user!
      if !current_user
        redirect_to login_path
      end
    end

    # Returns the user that has logged in
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    helper_method :current_user
end
