class SessionsController < ApplicationController

  @@current_user

  def login
    # will use omniauth in the future - for now will use custom login-page
    # redirect_to '/auth/developer/' 
  end

  def create
		#print "\n\n\n\n\n\n\n\n\n\n"
		#params[:login_hash].each do |key, value|
		#	print "here is the key: #{key} \n"
		#	print "here is the value: #{value} \n"
		#end
		#print "\n\n\n\n\n\n\n\n\n\n"
		
		# mimic the behavior of omniauth by converting login-info into an auth_hash
		auth_hash[:uid] = params[:login_hash]['email']
		auth_hash[:info][:email] = params[:login_hash]['email']
		auth_hash[:info][:name] = params[:login_hash]['name']
    @user = User.find_or_create_from_auth_hash(auth_hash)
    @@current_user = @user
    session[:user_id] = @user.id
    redirect_to "/profile/#{@user.id}/edit"
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
