class RemoveProfileIdFromComments < ActiveRecord::Migration
  def up
    remove_column :comments, :profile_id, :integer
  end

  def down
  	add_column :comments, :profile_id, :integer
  end
end
