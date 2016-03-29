class AddGroupImageToGroup < ActiveRecord::Migration
  def change
  	add_attachment :groups, :group_image
  end
end
