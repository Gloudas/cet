class UsersController < ApplicationController

  def new
  end

  def edit
  end

  def destroy
  end

  def find_or_create_from_auth_hash(auth_hash)
    # should create a new user or retreive the user if he already exists
    # just print out the auth_hash for now...
    print auth_hash
  end

end
