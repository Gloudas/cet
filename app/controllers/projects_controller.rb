class ProjectsController < ApplicationController

  def index
  end

  def new
  end

  def edit
  end

  def edit_collaborators
  end

  def destroy
  end

  def add_collaborator
    @collaborator = User.find(params[:userID])
    Project.add_collaborator(@collaborator)
  end

end
