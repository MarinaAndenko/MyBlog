class ChangeCountInPosts < ActiveRecord::Migration
  def change
  	change_column :posts, :views_count, :integer, default: 0

	  Post.reset_column_information
	  Post.all.each do |p|
	    Post.update_counters p.id, views_count: p.views.length
	  end
  end
end
