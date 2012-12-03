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

    puts 'HIHIHIHIHIHIHIHIH'
    puts auth_hash.to_s
    puts 'wtf is going on here'
    return

    auth_hash[:uid] = 'noelmoldvai@berkeley.edu'
    auth_hash[:info][:email] = 'noelmoldvai@berkeley.edu'
    auth_hash[:info][:name] = 'Noel Moldvai'
    
    puts 'hahahahahaha ok hit create'

    @is_new_user = true

    @user = User.find_or_create_from_auth_hash({:uid => 34, :info => {:email => 'noelmoldvai2@berkeley.edu', :name => 'noel'}})
    @@curent_user = @user
    session[:user_id] = @user.id
    redirect_to profile_path(@user.id) and return
#unless (params[:login_hash]).nil?
    if params[:login_hash]
      auth_hash[:uid] = params[:login_hash]['email']
      auth_hash[:info][:email] = params[:login_hash]['email']
      auth_hash[:info][:name] = params[:login_hash]['name']
    end

    puts 'moohaha hit this'
    
#if User.find_by_uid(auth_hash[:uid]).nil?
    if not User.find_by_uid(auth_hash[:uid])
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

    puts 'jfoiawifjasodfjSDJF hit this'

    @user = User.find_or_create_from_auth_hash(auth_hash)
    @@current_user = @user
    session[:user_id] = @user.id
    if @is_new_user
      redirect_to edit_profile_path(@user.id)
    else
      redirect_to profile_path(@user.id)
    end
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

  def auth_hash
    request.env['omniauth.auth']
  end

end
