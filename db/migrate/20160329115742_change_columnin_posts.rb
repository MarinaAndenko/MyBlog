class ChangeColumninPosts < ActiveRecord::Migration
  def up
  	add_column :posts, :views_count, :integer, default: 0
  end
  def down
  	remove_column :posts, :views_counter, :integer, default: 0
  end
end
