module CommentHelper
	def delele_comment?(comment)
		posts = Post.joins(:blog).where(blogs: { user_id: current_user.id })
		if comment.commentable_type == "User" && 
			if comment.commentable_id == current_user.id
				return true
			end
			binding.pry
		elsif comment.commentable_type == "Post" 
			posts.each do |post|
				if comment.commentable_id == post.id
					return true
				end 
			end
	  end  
	end
end
