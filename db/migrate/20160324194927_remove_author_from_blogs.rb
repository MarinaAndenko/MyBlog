class RemoveAuthorFromBlogs < ActiveRecord::Migration
  def change
    remove_column :blogs, :author, :string
  end
end
