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
  
  def create
    @document = Document.new(params[:document])
    @document.project = @project
    @document.updater = @user
    @project.documents << @document

    if @document.save
      flash[:notice] = "Document created successfully"
      redirect_to project_path(@project.id)        
    else
      flash[:error] = "There was a problem creating your document"
      redirect_to new_doc_path(@project.id)
    end
  end
  
  def new
    @document = Document.new
  end
  
  def edit
    @document = Document.find_by_id(params[:did])
    if @document
      @document.updater = @user
    else
      #THIS SHOULD NEVER HAPPEN, BUT I GUESS IT DOES
      #@document = Document.create(params[:document])
      #new
      
    end
  end


end
