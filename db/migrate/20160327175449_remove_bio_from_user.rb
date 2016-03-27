class RemoveBioFromUser < ActiveRecord::Migration
  def up
    remove_column :users, :bio, :text
  end

  def down
  	add_column :users, :bio, :text
  end
end
