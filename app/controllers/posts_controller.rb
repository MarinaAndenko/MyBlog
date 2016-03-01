class PostsController < ApplicationController

  	def index
		@page = params[:page]
		@posts = Post.all.paginate(page: @page, :per_page => 10)
	end

	def show
		@post = Post.find(params[:id])
		@commentable = commentable
		@comment = @commentable.comments.new
		@comments = @commentable.comments
		@route = comments_path(post_id: @post.id) 
	end

	def new
		@blogs = Blog.all.where("user_id=#{current_user.id}")
		@blog = params[:blog_id] ? Blog.find(params[:blog_id]) : nil
		@blog ? @post = @blog.posts.new : @post = Post.new
		@post.blog_id = params[:blog_id] if @post == nil
	end

	def create
		@blogs = Blog.all.where("user_id=#{current_user.id}")
		blog = params[:blog_id] ? Blog.find(params[:blog_id]) : nil
		blog ? @post = blog.posts.create(post_params) : @post = Post.new(post_params)
		@post.blog_id = params[:post][:blog_id] if @post.blog_id == nil
		if @post.save
			redirect_to @post
		else
			render 'new' 
		end
	end 

	def edit
		@post = Post.find(params[:id])
	end 

	def update
		@post = Post.find(params[:id])
		if @post.update(post_params)
			redirect_to @post
		else
			render 'edit' 
		end
	end 

	def destroy
		@post = Post.find(params[:id])
		@blog = Blog.find(@post.blog_id)
		@post.destroy
		redirect_to blog_path(@blog)
	end 

	private
	def post_params
		params.require(:post).permit(:name, :description, :text)
	end

	def comment_params
    	params.require(:comment).permit(:body)
  	end

  	def commentable
    if params[:user_id]
      id = params[:user_id]
      User.find(params[:id])
    else
      id = params[:post_id]
      Post.find(params[:id])
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