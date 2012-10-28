class SchoolsController < ApplicationController

  def index
    @schools = School.all
  end

  def show
    @projects = self.projects
  end

  def projects
    @projects = self.projects
  end

  def new
  end

  def edit
  end

  def destroy
  end

end
