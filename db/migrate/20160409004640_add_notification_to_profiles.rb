class AddNotificationToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :notifications, :boolean
  end
end
