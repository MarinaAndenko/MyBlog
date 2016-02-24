class AdminController < ApplicationController
	before_filter :admin_only
	def index
	end
	def edit_user_role
		@page = params[:page]
		@users = User.all.paginate(page: @page, :per_page => 5)
		@users.each do |user|
			if params['people2']!=nil 
				if params['people2'].include? user.id.to_s
					user.role = "user" 
				end 
			end
			if params['people']!=nil 
				if params['people'].include? user.id.to_s
					user.role = "admin" 
				end
			end
  			user.save
		end
	end
	def admin_only
    unless current_user.admin?
      redirect_to home_path
    end
  end
end
