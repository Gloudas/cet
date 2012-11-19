class SchoolsController < ApplicationController

  before_filter :set_current_user, :set_school

  def set_school
    if params[:school] != params[:school].downcase
      redirect_to school_path(params[:school].downcase) and return
    end
    @school = School.find_by_uri(params[:school])
    redirect_to home_path and return if not @school
  end

  def index
    @schools = School.all
  end

  def show
    @projects = @school.projects
  end

  def new
  end

  def edit
  end

  def destroy
  end

end
