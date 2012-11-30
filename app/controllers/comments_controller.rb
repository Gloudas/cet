class CommentsController < ApplicationController

  before_filter :set_current_user
  before_filter :set_can_edit

  def create
    # can create only if you are collaborator
    if @can_edit
      # should just set the text field
      comment = Comment.new(params[:comment])
      comment.user = @user
      comment.project = @project
      if comment.save
        flash[:notice] = "Commented!"
      else
        flash[:error] = "Oops, something went wrong with creating your comment."
      end
    else
      flash[:error] = "You can't comment on this project!"
    end
    redirect_to project_path(@project.id)
  end

  def destroy
    comment = Comment.find_by_id(params[:comid])
    if @can_edit
      # can destroy only if you are collaborator
      if comment.destroy
        flash[:notice] = "Comment deleted!"
      else
        flash[:error] = "Oops, something went wrong with deleting your comment."
      end
    else
      flash[:error] = "You can't delete this comment!"
    end
    redirect_to project_path(@project.id)
  end
end
