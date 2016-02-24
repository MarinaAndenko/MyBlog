class CommentsController < ApplicationController

  def new
    @commentable = commentable
    @comment = @commentable.comments.new
  end

  def create
    @commentable = commentable
    @comment = @commentable.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
    	redirect_to commentable_url(commentable)
  	end
  end

  def edit
    @commentable = commentable
    @comment = @commentable.comments.find(params[:id])
  end

  def update
    @commentable = commentable
    @comment = @commentable.comments.find(params[:id])
    if @comment.update_attributes(comment_params)
      redirect_to commentable_url(commentable)
    end
  end

  def destroy
    @commentable = commentable
    @comment = @commentable.comments.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html do
        redirect_to commentable_url(commentable)
      end
      format.js
    end
  end

private
  def comment_params
    params.require(:comment).permit!
  end

  def commentable
    if params[:user_id]
      id = params[:user_id]
      User.find(params[:user_id])
    else
      id = params[:post_id]
      Post.find(params[:post_id])
    end
  end 

  def commentable_url(commentable)
    if User === commentable
      user_path(commentable)
    else
      post_path(commentable)
    end
  end

end
