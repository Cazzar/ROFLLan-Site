class CreateSignups < ActiveRecord::Migration
  def change
    create_table :signups do |t|
      t.belongs_to :lan, null: false
      t.belongs_to :user, null: false
      t.boolean :paid, null: false, default: 0

      t.timestamps
    end
  end
end
