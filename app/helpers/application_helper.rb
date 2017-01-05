module ApplicationHelper
	def commentable_url
  		commentable = controller.controller_name.singularize
  		comments_path(:commentable_type => commentable, :commentable_id => controller.instance_variable_get("@#{commentable}").id)
	end
end
