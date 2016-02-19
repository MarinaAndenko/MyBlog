module BlogsHelper
	def find_username(blog)
		user = User.find(blog.user_id)
		user.username
	end 
end