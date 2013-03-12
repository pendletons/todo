class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :name
      t.integer :category_id
      t.integer :user_id

      t.timestamps
    end
    add_index :lists, :category_id
    add_index :lists, :user_id
  end
end
