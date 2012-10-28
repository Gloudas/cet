class SchoolsController < ApplicationController

  def index
    @schools = School.all
  end

  def show
    name = params[:school]
    school = School.find_by_name(name)
    @projects = school.projects
  end

  def new
  end

  def edit
  end

  def destroy
  end

end
