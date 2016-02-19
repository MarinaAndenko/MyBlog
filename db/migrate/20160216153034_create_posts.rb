class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :name
      t.text :description
      t.text :text
      t.references :blog, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
