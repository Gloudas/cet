class ProjectsController < ApplicationController

  before_filter :set_current_user
  # add filter for being able to edit other's projects/set permissions on who can edit

  def index
  end

  def new_or_edit

    # see if we are creating a new project or just editing an existing one
    if params[:pid]
      project = params[:pid]
    else
      project = Project.new
    end
    project_info = params[:project]

    collabs = Array.new
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
    
    project.title = project_info[:title]
    project.description = project_info[:description]
    collabs.each do |collab|
      project.users << collab
    end

    project.save!

    redirect_to edit_project_path(project.id)
  end

  def new
    if params[:project]
      new_or_edit
    end
  end

  def edit
    if params[:project]
      new_or_edit
    end
    @project = Project.find_by_id(params[:pid])
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
