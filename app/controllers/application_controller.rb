class ApplicationController < ActionController::Base
  protect_from_forgery

  def set_current_user
    # find_by_id(nil) returns nil
    @user ||= Moviegoer.find_by_id(session[:user_id])
    redirect_to home_path and return unless @user 
  end
  
end
