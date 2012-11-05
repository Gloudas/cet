class UsersController < ApplicationController

  before_filter :set_current_user

  def show
    # user is set in the filter
  end

  def edit
    # user is set in the filter
    if params[:project]
      # process the form
      params[:project]
    end
  end

end
