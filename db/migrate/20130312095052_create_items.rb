class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.integer :list_id
      t.integer :status_id, default: 0

      t.timestamps
    end
    add_index :items, :list_id
    add_index :items, :status_id
  end
end
