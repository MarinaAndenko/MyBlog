class BlogsController < ApplicationController
	require 'will_paginate/array' 
	skip_before_action :authenticate_user!, :only => [:index]
	load_and_authorize_resource

	def index
		@page = params[:page]
		q = params[:user_id] ? "user_id = #{params[:user_id]}" : ''
		authenticate_user! if q != ''
		@blogs = Blog.all.where(q).paginate(page: @page, :per_page => 10)
	end

	def show
		@blog = Blog.find(params[:id])
		@page = params[:page]
		@posts = @blog.posts
		@posts = @posts.paginate(page: @page, :per_page => 10)
	end

	def new
		user = current_user
		@blog = user.blogs.new
	end

	def create
		user = current_user
		@blog = user.blogs.create(blog_params)
		if @blog.save
			redirect_to blog_path(@blog)
		else
			render 'new' 
		end
	end 

	def edit
		@blog = Blog.find(params[:id])
	end 

	def update
		@blog = Blog.find(params[:id])
		if @blog.update(blog_params)
			redirect_to @blog
		else
			render 'edit' 
		end
	end 

	def destroy
		@blog = Blog.find(params[:id])
		@user = User.find(@blog.user_id)
		@blog.destroy
		redirect_to blogs_path(@user)
	end 

	private
	def blog_params
		params.require(:blog).permit( :name, :description)
	end
end