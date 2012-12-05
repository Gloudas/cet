class UsersController < ApplicationController

  before_filter :set_current_user, :set_is_mine, :except => :index

  def set_is_mine
    @is_mine = @user.id.to_s == params[:uid]
  end

  def show
    @profile = User.find_by_id(params[:uid])
    @projects = @user.projects.order("updated_at DESC")
  end

  def edit
    if not @is_mine
      # this is not your profile
      flash[:error] = "Permission denied..."
      redirect_to profile_path and return
    end
    if params[:profile]
      # the form has been submitted
      # update all the fields
      params[:profile].each do |att, value|
        @user[att] = value
      end

      if @user.save
        flash[:notice] = "Your profile was successfully edited!"
        redirect_to profile_path(@user.id) and return
      else
        flash[:error] = "Sorry, something went wrong with editing your profile."
        redirect_to edit_profile_path and return
      end
    end
  end

  def update_profile_picture
    old_profile_picture = @user.avatar
    @user.attributes = params[:user]
    if @user.save
      old_profile_picture.destroy if old_profile_picture
      flash[:notice] = "Profile picture added successfully"
      redirect_to profile_path(@user.id)
    else
      flash[:error] = "Oops, something went wrong!"
      redirect_to edit_profile_path(@user.id)
    end
  end

  def destroy_profile_picture
    @user.avatar.destroy if @user.avatar
    @user.avatar = nil
    redirect_to profile_path(@user.id)
  end

end
