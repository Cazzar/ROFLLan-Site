class CreateLans < ActiveRecord::Migration
  def change
    create_table :lans do |t|
      t.string :name
      t.string :max_players
      t.text :description
      t.string :start_date
      t.string :end_date 

      t.timestamps
    end
    add_index :lans, :id, unique: true
  end
end
