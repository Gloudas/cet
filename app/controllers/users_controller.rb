class UsersController < ApplicationController

  before_filter :set_current_user

  def show
    # user is set in the filter
  end

  def edit
    # user is set in the filter
    if params[:profile]
      # the form has been submitted
      # update all the fields
      params[:profile].each do |att, value|
        @user[att] = value
      end

    success = @user.save
    if success
      redirect_to profile_path(@user.id) and return
    else
      flash[:error] = "Sorry, something went wrong with editing your profile"
      redirect_to edit_profile_path
    end
  end

end
