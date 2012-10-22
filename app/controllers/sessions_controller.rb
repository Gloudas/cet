class SessionsController < ApplicationController

  @@current_user

  def login
    redirect_to 'auth/developer/'
  end

  def create
    @user = User.find_or_create_from_auth_hash(auth_hash)
    print "\n\n\n\n\n\n\n\n"
    print User.all
    print "\n\n\n\n\n\n\n\n"
    @@current_user = @user
    session[:user_id] = @user.id
    redirect_to '/berkeley'
  end

  def failure
    render :text => "Sorry, but we didn't receive the permissions we need for your account."
  end

  def destroy
    @@current_user = nil
    session[:user_id] = nil 
    render :text => "You've logged out!"
  end

  def auth_hash
    request.env['omniauth.auth']
  end

end
