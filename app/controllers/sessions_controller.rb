class SessionsController < ApplicationController

  @@current_user

  def login
    # will use omniauth in the future - for now will use custom login-page
    # redirect_to '/auth/developer/'
  end

  def create
    #print "\n\n\n\n\n\n\n\n\n\n"
    #params[:login_hash].each do |key, value|
    #  print "here is the key: #{key} \n"
    # mimic the behavior of omniauth by converting login-info into an auth_hash
=begin
    unless (params[:login_hash]).nil?
      auth_hash[:uid] = params[:login_hash]['email']
      auth_hash[:info][:email] = params[:login_hash]['email']
      auth_hash[:info][:name] = params[:login_hash]['name']
    end
    
    if User.find_by_uid(auth_hash[:uid]).nil?
      # validate email format
      results = ValidatesEmailFormatOf::validate_email_format(auth_hash[:uid], :message => "is not of a valid format!")
      unless results.nil?
        flash[:error] = "Please use a valid email address!"
        redirect_to login_path and return
      end
      @is_new_user = true
      flash[:notice] = "Welcome new user! Please fill out your profile information."
    else
      @is_new_user = false
    end
    @user = User.find_or_create_from_auth_hash(auth_hash)
    @@current_user = @user
=end
    @user = User.find_by_provider_and_password_digest(auth[:provider], auth[:uid])
    if @user
      # user already exists
      redirect_to profile_path(@user.id)
    else
      User.create_with_omniauth(auth)
      flash[:notice] = "Welcome new user! Please fill out your profile information."
      redirect_to edit_profile_path(@user.id)
    end
    session[:user_id] = @user.id
  end

  def failure
    render :text => "Sorry, but we didn't receive the permissions we need for your account."
  end

  def destroy
    @@current_user = nil
    session[:user_id] = nil
  end

  def validate
    render :text => "HIT THE VALIDATE PAGE"
  end

  def auth
    request.env['omniauth.auth']
  end

end
