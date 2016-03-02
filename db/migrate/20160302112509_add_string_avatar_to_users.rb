class AddStringAvatarToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :avatar, :string
  end

  def self.down
    remove_attachment :users, :avatar
  end
end
