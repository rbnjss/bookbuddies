class AddGroupIdToBooks < ActiveRecord::Migration
  def change
    add_reference :books, :group, index: true, foreign_key: true
  end
end
