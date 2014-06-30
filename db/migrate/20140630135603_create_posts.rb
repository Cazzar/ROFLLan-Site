class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
 			t.belongs_to :user
 			t.string :title
 			t.text :data
 			
      t.timestamps
    end
  end
end
