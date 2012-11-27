class DocumentsController < ApplicationController
  before_filter :set_current_user
  before_filter :check_permissions
  
  def check_permissions
    #check to see if current user can add/modify docs
    @project = Project.find_by_id(params[:did])
    if not @project.users.include? @user
      redirect_to project_path(@project.id) and return
    end
  end
  
  def new
    @document = Document.new
    
    document.project = @project
    document.description = params[:document][:descriptrion]
    document.uploader = @user
    document.updater = @user
    
    success = doc.save
    if success
      flash[:notice] = "Document successfully created!"
      redirect_to project_path(project.id) and return
    else
      flash[:error] = "Sorry, something went wrong with creating this document"
      redirect_to project_path(project.id) 
      #is this the right way to do this?
    end
    
  end
  
  def edit
    @document = Document.find_by_id(params[:did])
    @document.updater = @user
  end


end
