class UsersController < ApplicationController

  before_filter :set_current_user

  def show
    # user is set in the filter
  end

  def edit
    # user is set in the filter
  end

  def destroy
  end

end
