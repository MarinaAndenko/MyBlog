class AddDefaultValueToUsers < ActiveRecord::Migration
  def up
    change_column :users, :role, :string, default: "user"
  end

  def down
	change_column :users, :role, :string, default: nil
  end
end
