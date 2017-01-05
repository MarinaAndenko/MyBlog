class AddColumnToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :views_counter, :integer
  end
end
