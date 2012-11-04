class ProjectsController < ApplicationController

  before_filter :set_current_user

  def index
  end

  def create
    collabs = Array.new
    project_info = params[:project]
    if not params[:collab1].nil?
      collabs.push(User.find_by_name(project_info[:collab1]))
    end
    if not params[:collab2].nil?
      collabs.push(User.find_by_name(project_info[:collab2]))
    end
    if not params[:collab3].nil?
      collabs.push(User.find_by_name(project_info[:collab3]))
    end
    if not params[:collab4].nil?
      collabs.push(User.find_by_name(project_info[:collab4]))
    end
    
    project = Project.new(:title => project_info[:title], :description => project_info[:description])
    collabs.each do |collab|
      project.users << collab
    end

    project.save!

    redirect_to edit_project_path(project.id)
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
