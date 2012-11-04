class ProjectsController < ApplicationController

  def index
  end

  def create
    collabs = Array.new

    if not params[:collab1].nil?
      collabs.push(User.find_by_name(params[:collab1]))
    end
    if not params[:collab2].nil?
      collabs.push(User.find_by_name(params[:collab2]))
    end
    if not params[:collab3].nil?
      collabs.push(User.find_by_name(params[:collab3]))
    end
    if not params[:collab4].nil?
      collabs.push(User.find_by_name(params[:collab4]))
    end
    
    project = Project.new(:title => params[:title], :description => params[:description])
    collabs.each do |collab|
      project.users << collab
    end

    project.save!

    redirect_to edit_project_path(project.school, project.id)
  end

  def new
  end

  def edit
    @project = Project.find(params[:pid])
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
