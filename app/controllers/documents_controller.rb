class DocumentsController < ApplicationController
  before_filter :set_current_user
  before_filter :check_permissions
  
  def check_permissions
    #check to see if current user can add/modify docs
    @project = Project.find_by_id(params[:pid])
    if @project and not @project.users.include? @user
      flash[:error] = "Update a File: Permission denied"
      redirect_to project_path(@project.id) and return
    end
  end
  
  def new
    logger.info("hello")
    @document = Document.create(params[:document])
    logger.info("nice to see you")
    #@document.project = @project
    @project.documents << @document
    @document.project = @project
    #document.description = params[:document][:descriptrion]
    #document.uploader = @user
    @document.updater = @user
    logger.info("hope shit is well")
    
    flash[:notice] = "Document Created Successfully"    
    redirect_to project_path(@project.id)
    
    logger.info("goodbye")
    
    #THIS REDIRECT IS NOT WORKING!!!
  end
  
  def edit
    @document = Document.find_by_id(params[:did])
    if @document
      @document.updater = @user
    else
      @document = Document.create
    end
  end


end
