class ProjectsController < ApplicationController

  # TODO: re-enable after the fucking bullshit cuke login shit works. piece of shit
  #before_filter :set_current_user
  # add filter for being able to edit other's projects/set permissions on who can edit

  def new_or_edit
    # see if we are creating a new project or just editing an existing one
    if params[:pid]
      project = Project.find_by_id(params[:pid])
    else
      project = Project.new
    end
    project_info = params[:project]

    project_info[:collaborator].each do |email|
      # ignore nil values
      next if not email
      collab = User.find_by_email(email)
      project.users << collab if collab
    end if project_info[:collaborator]

    project.title = project_info[:title]
    project.description = project_info[:description]
    #TODO: reenable after cuke bullshit works again
    #project.creator_id = @user.id

    # to do: validations on the project model
    success = project.save
    redirect_to project_path(project.id) and return if success
    # if unsuccessful, flash an error
    if params[:pid]
      flash[:error] = "Sorry, something went wrong with editing this project."
      redirect_to edit_project_path(project.id)
    else
      flash[:error] = "Sorry, something went wrong with creating a new project."
      redirect_to new_project_path
    end
  end

  def new
    if params[:project]
      # process the form
      new_or_edit and return
    end
  end

  def edit
    if params[:project]
      # process the form
      new_or_edit and return
    end
    @project = Project.find_by_id(params[:pid])
  end

  def show
    @project = Project.find_by_id(params[:pid])
  end

  def destroy
  end

  def add_collaborator
    @collaborator = User.find(params[:userID])
    Project.add_collaborator(@collaborator)
  end

end
