class RemoveInceptDateFromGroup < ActiveRecord::Migration
  def change
    remove_column :groups, :inceptDate, :string
  end
end
