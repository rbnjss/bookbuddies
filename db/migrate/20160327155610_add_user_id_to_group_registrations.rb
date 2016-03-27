class AddUserIdToGroupRegistrations < ActiveRecord::Migration
  def change
    add_column :group_registrations, :user_id, :integer
  end
end
