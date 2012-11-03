class ProjectsController < ApplicationController

  def index
  end

  def new
    collabs = Array.new

    if not params[:collab1].nil?
      collabs.push(params[:collab1])
    end
    if not params[:collab2].nil?
      collabs.push(params[:collab2])
    end
    if not params[:collab3].nil?
      collabs.push(params[:collab3])
    end
    if not params[:collab4].nil?
      collabs.push(params[:collab4])
    end
    
    project = Project.new(:title => params[:title], :description => params[description])
    collabs.each do |collab|
      project.users << collab
    end

    project.save!
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
