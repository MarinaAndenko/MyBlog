class RemoveColumnFromPosts < ActiveRecord::Migration
  def change
  	remove_column :posts, :views_counter, :integer, default: 0
  end
end
