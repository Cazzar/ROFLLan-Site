class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :user
      t.string :password
      t.string :salt
      t.integer :permissions

      t.timestamps
    end
    add_index :users, :email, unique: true
    add_index :users, :user, unique: true
  end
end
