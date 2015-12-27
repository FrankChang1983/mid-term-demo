class AddColumnsToTables < ActiveRecord::Migration
  def change
    add_column :comments, :user_id, :integer
    add_index :comments, :user_id
    add_index :comments, :newmessage_id
    add_index :newmessages, :user_id
    add_index :newmessages, :category_id
  end
end
