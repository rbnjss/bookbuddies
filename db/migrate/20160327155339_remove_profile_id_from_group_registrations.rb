class RemoveProfileIdFromGroupRegistrations < ActiveRecord::Migration
  def up
    remove_column :group_registrations, :profile_id, :integer
  end

  def down
  	add_column :group_registrations, :profile_id, :integer
  end
end
