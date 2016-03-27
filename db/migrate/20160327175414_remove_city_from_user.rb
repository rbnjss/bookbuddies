class RemoveCityFromUser < ActiveRecord::Migration
  def up
    remove_column :users, :city, :string
  end

  def down
  	add_column :users, :city, :string
  end
end
