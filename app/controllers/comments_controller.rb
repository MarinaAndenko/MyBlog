class CommentsController < ApplicationController

  def new
    @commentable = commentable
    @comment = @commentable.comments.new
  end

  def create
    @commentable = commentable
    @comment = @commentable.comments.new(comment_params)
    @comment.user = current_user
      json = if @comment.save
       { json: { comment: render_to_string("comments/_comment", layout: false, locals:{comment: @comment}) }}
      end 
      render json
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
    json = if  @comment.destroy
      { json: { comment_del: render_to_string("comments/_comment", layout: false, locals:{comment: @comment}) }}
    end 
    render json
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

  def commentable_field
    if User === commentable
      @store = User.find(params[:user_id])
    else
      @store = Post.find(params[:post_id])
    end
  end

end