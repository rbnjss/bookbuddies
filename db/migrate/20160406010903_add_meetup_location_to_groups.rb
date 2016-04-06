class AddMeetupLocationToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :meetup_location, :string
  end
end
