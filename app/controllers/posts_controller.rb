class PostsController < ApplicationController

  	def index
		@page = params[:page]
		@posts = Post.all.paginate(page: @page, :per_page => 10)
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@blogs = Blog.all.where("user_id=#{current_user.id}")
		blog = params[:blog_id] ? Blog.find(params[:blog_id]) : nil
		blog ? @post = blog.posts.new : @post = Post.new
		@post.blog_id = params[:blog_id] if @post == nil
		#binding.pry
		#@board.category = @category
		#@blog.posts = params[:post]
	end

	def create
		@blogs = Blog.all.where("user_id=#{current_user.id}")
		@blog = params[:blog_id] ? Blog.find(params[:blog_id]) : nil
		@blog ? @post = @blog.posts.create(post_params) : @post = Post.new(post_params)
		@post.blog_id = params[:post][:blog_id] if @post.blog_id == nil
		binding.pry
		if @post.save
			redirect_to post_path(@post)
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
			render 'show'
		else
			render 'edit' 
		end
	end 

	def destroy
		@post = Post.find(params[:id])
		@blog = Blog.find(@post.blog_id)
		@post.destroy
		redirect_to blog_path(@blog)
		#binding.pry
	end 

	private
	def post_params
		params.require(:post).permit(:name, :description, :text)
	end
end
