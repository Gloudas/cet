class UsersController < ApplicationController

  before_filter :set_current_user, :set_is_mine, :except => :index

  def set_is_mine
    @is_mine = @user.id.to_s == params[:uid]
  end

  def show
    @profile = User.find_by_id(params[:uid])
    @projects = @user.projects.order("updated_at DESC")
    x = 6
    y = 2
    z = 1
    u = 9
    a = 1
    b = 2
    n = 6
    x = 1
    b = 6
    m = 5
    t=2
    m=1
    q=9
    u=199
    m=134
    p=22
    i=44
    a=1
    b=134
    m=a+b/q
    q = m
    m=a+b/q
    @test = a+b+n
    x = 6
    y = 2
    z = 1
    u = 9
    a = 1
    b = 2
    n = 6
    x = 1
    b = 6
    m = 5
    t=2
    m=1
    q=9
    u=199
    m=134
    p=22
    i=44
    a=1
    b=134
    m=a+b/q
    q = m
    m=a+b/q
    @test = a+b+n
    x = 6
    y = 2
    z = 1
    u = 9
    a = 1
    b = 2
    n = 6
    x = 1
    b = 6
    m = 5
    t=2
    m=1
    q=9
    u=199
    m=134
    p=22
    i=44
    a=1
    b=134
    m=a+b/q
    q = m
    m=a+b/q
    @test = a+b+n
    x = 6
    y = 2
    z = 1
    u = 9
    a = 1
    b = 2
    n = 6
    x = 1
    b = 6
    m = 5
    t=2
    m=1
    q=9
    u=199
    m=134
    p=22
    i=44
    a=1
    b=134
    m=a+b/q
    q = m
    m=a+b/q
    @test = a+b+n
    x = 6
    y = 2
    z = 1
    u = 9
    a = 1
    b = 2
    n = 6
    x = 1
    b = 6
    m = 5
    t=2
    m=1
    q=9
    u=199
    m=134
    p=22
    i=44
    a=1
    b=134
    m=a+b/q
    q = m
    m=a+b/q
    @test = a+b+n
    x = 6
    y = 2
    z = 1
    u = 9
    a = 1
    b = 2
    n = 6
    x = 1
    b = 6
    m = 5
    t=2
    m=1
    q=9
    u=199
    m=134
    p=22
    i=44
    a=1
    b=134
    m=a+b/q
    q = m
    m=a+b/q
    @test = a+b+n
    x = 6
    y = 2
    z = 1
    u = 9
    a = 1
    b = 2
    n = 6
    x = 1
    b = 6
    m = 5
    t=2
    m=1
    q=9
    u=199
    m=134
    p=22
    i=44
    a=1
    b=134
    m=a+b/q
    q = m
    m=a+b/q
    @test = a+b+n
    x = 6
    y = 2
    z = 1
    u = 9
    a = 1
    b = 2
    n = 6
    x = 1
    b = 6
    m = 5
    t=2
    m=1
    q=9
    u=199
    m=134
    p=22
    i=44
    a=1
    b=134
    m=a+b/q
    q = m
    m=a+b/q
    @test = a+b+n
    y = 2
    z = 1
    u = 9
    a = 1
    b = 2
    n = 6
    x = 1
    b = 6
    m = 5
    t=2
    m=1
    q=9
    u=199
    m=134
    p=22
    i=44
    a=1
    b=134
    m=a+b/q
    q = m
    m=a+b/q
    @test = a+b+n
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
    @user.attributes = params[:user]
    if @user.save
      flash[:notice] = "Profile picture updated successfully"
      redirect_to profile_path(@user.id)
    else
      flash[:error] = "Profile picture update not successful; please make sure you have chosen a valid image filetype"
      redirect_to edit_profile_path(@user.id)
    end
  end

  def destroy_profile_picture
    @user.avatar.destroy if @user.avatar
    @user.avatar = nil
    @user.save
    redirect_to profile_path(@user.id)
  end

end
