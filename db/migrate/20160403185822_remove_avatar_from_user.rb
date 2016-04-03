class RemoveAvatarFromUser < ActiveRecord::Migration
  def up
  	remove_attachment :users, :avatar
  end
  def down
  	add_attachment :users, :avatar
  end
end
