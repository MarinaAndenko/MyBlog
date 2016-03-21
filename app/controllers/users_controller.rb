class UsersController < ApplicationController
  
  def show
  	@user = User.find_by_username(params[:username])
    User.all.each {|user| user.avatar.recreate_versions!  if user.avatar? }
  	@q_posts = 0
  	@user.blogs.each do |blog|
  		@q_posts += blog.posts.count 
  	end
  	posts = Post.joins(:blog).where(:blogs => { user_id: @user.id })
  	@last_post = posts.last
  	@commentable = commentable
	  @comment = @commentable.comments.new
	  @comments = @commentable.comments
    @route = comments_path(user_id: @user.id) 
  end

  def edit
  	@user = User.find_by_username(params[:username])
  end

  def update
  	@user = User.find_by_username(params[:username])
    if params['remove_avatar']== 'true'
      @user.remove_avatar!
      @user.remove_avatar = true
    end 
  	if @user.update!(user_params)
			redirect_to @user
	  else
			render 'edit' 
	  end
  end

  private
  def user_params
  	params.require(:user).permit(:information, :avatar)
  end 
  def comment_params
   	params.require(:comment).permit(:body)
  end

  def commentable
      id = params[:user_id]
      User.find_by_username(params[:username])
  end 

  def commentable_url(commentable)
    if User === commentable
      user_path(commentable)
    else
      post_path(commentable)
    end
  end
  
end