class UsersController < ApplicationController

  before_filter :set_current_user

  def new
    # this should be handled by User model
  end

  def new_project

  end

  def show
  end

  def edit
  end

  def destroy
  end

end
