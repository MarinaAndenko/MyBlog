class CreateViewsTable < ActiveRecord::Migration
  def change
  	drop_table :views
    create_table :views do |t|
      t.references :user, index: true, foreign_key: true
      t.references :post, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end