class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.references :book, index: true, foreign_key: true
      t.references :comment, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.boolean :subscribe

      t.timestamps null: false
    end
  end
end
