class RemoveUserFromList < ActiveRecord::Migration
  def change
    change_table :lists do |t|
      t.remove :user_id
    end
  end
end
