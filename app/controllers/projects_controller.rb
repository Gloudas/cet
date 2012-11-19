class ProjectsController < ApplicationController

  before_filter :set_current_user
  before_filter :set_can_edit, :except => :new

  def set_can_edit
    @project = Project.find_by_id(params[:pid])
    @can_edit = @project.users.include? @user
  end

  def new_or_edit
    # see if we are creating a new project or just editing an existing one
    if params[:pid]
      project = Project.find_by_id(params[:pid])
    else
      project = Project.new
    end
    project_info = params[:project]

    project.add_collaborator(@user)

    project.title = project_info[:title]
    project.description = project_info[:description]
    project.creator = @user
    project.school_id = @user.school

    # to do: validations on the project model
    success = project.save
    if success
      if params[:pid]
        flash[:notice] = "Project successfully edited!"
      else
        flash[:notice] = "Project successfully created!"
      end
      redirect_to project_path(project.id) and return
    end
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
    if not @can_edit
      redirect_to project_path(@project.id) and return
    end
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

  def edit_collaborators
  end

  def add_collaborator
    email = params[:collaborator]
    success = @project.add_collaborator_by_email(email)
    if success
      flash[:notice] = "Collaborator added!"
    else
      flash[:error] = "Invalid collaborator!"
    end
    redirect_to edit_collaborators_path
  end

  def destroy_collaborator
    collaborator = User.find_by_id(params[:cid])
    if collaborator == @user
      # can't delete yourself
      redirect_to edit_collaborators_path and return
    end
    success = @project.users.delete(collaborator)
    if success
      flash[:notice] = "Collaborator deleted!"
    else
      flash[:error] = "Oops! Something went wrong."
    end
    redirect_to edit_collaborators_path
  end

end
