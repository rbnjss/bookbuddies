class RemoveBookIdAndCommentIdFromNotifications < ActiveRecord::Migration
  def up
  	remove_column :notifications, :book_id, :integer
  	remove_column :notifications, :comment_id, :integer
  end
  def down
  	add_column :notifications, :book_id, :integer
  	add_column :notifications, :comment_id, :integer
  end
end
