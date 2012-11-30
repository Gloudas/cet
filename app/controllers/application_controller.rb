class ApplicationController < ActionController::Base
  protect_from_forgery

  def set_current_user
    # find_by_id(nil) returns nil
    @user ||= User.find_by_id(session[:user_id])
    if not @user
      flash[:error] = "Permission Denied...."
      redirect_to home_path and return
    end
  end

  def set_can_edit
    @project = Project.find_by_id(params[:pid])
    @can_edit = @project.users.include? @user
  end

  def time_ago(timestamp)
    return time_ago_in_words(timestamp) + " ago"
  end
end
