class AdminController < ApplicationController
	require 'admin_helper'
	include AdminHelper
	def index
	end
	 #<%= form_tag("/edit_user_role", method: "get") do %>
	def edit_user_role
		#params.require(:user).permit(:role)
		@users = User.all.paginate(:page => params[:page], :per_page => 5)
		#@user = User.find(params[:id])
		#User.update_all
		#redirect_to admin_path 
		#<%=  check_box("user", "checked[#{user.id}]", {checked: check_if_true(user.role) }, {unchecked: check_if_true(user.role) }) %>
		#user.role', "admin", (user.role == "admin" ? true : false)
	end
	def update_role (user)
		params[:role] = "admin"
	end
	def update
		User.all.each do |user|
			if params['people']!=nil
				user.role = "" if params['people2'].include? user.email
				user.role = "admin" if params['people'].include? user.id.to_s
			end
			#if 'people2[id]'!=nil
			#	user.role = "" if 'people2[id]'.include? user.email
			#end
			user.save
		end
		redirect_to '/admin_panel'
	end 
	#private
	#def user_params
	#	params.require(:user).permit(:role)
	#end

end
