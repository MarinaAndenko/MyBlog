module AdminHelper
	def update_role (user)
		params[:role] = "admin"
	end
	def checked(person,area)
		 person.nil? ? false : person.match(area)
	end 
end
