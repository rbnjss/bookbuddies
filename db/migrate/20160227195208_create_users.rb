class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :user_name
      t.binary :avatar
      t.text :bio
      t.string :city

      t.timestamps null: false
    end
  end
end
