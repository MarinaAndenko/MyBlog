class AddDefaultValueToPosts < ActiveRecord::Migration
  def up
	  change_column :posts, :views_counter, :integer, default: 0
	end

	def down
	  change_column :posts, :views_counter, :integer, default: nil
	end
end
