class RemoveCountFromPosts < ActiveRecord::Migration
  def change
  	remove_column :posts, :views_count
  end
end
