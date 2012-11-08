class UsersController < ApplicationController

  before_filter :set_current_user

  def show
    @profile = User.find_by_id(params[:uid])
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
        flash[:notice] = "Your profile was successfully edited!"
        redirect_to profile_path(@user.id) and return
      else
        flash[:error] = "Sorry, something went wrong with editing your profile."
        redirect_to edit_profile_path and return
      end
    end
  end

end
