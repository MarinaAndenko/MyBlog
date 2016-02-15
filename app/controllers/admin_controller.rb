class AdminController < ApplicationController
	before_filter :admin_only
	def index
	end
	def edit_user_role
		@page = params[:page]
		@users = User.all.paginate(page: @page, :per_page => 5)
		@cur_page = @users.total_pages
		@users.each do |user|
			if params['people2']!=nil 
				user.role = "user" if params['people2'].include? user.id.to_s
			end
			if params['people']!=nil 
				user.role = "admin" if params['people'].include? user.id.to_s
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
