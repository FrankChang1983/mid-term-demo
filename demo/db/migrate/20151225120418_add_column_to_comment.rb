class AddColumnToComment < ActiveRecord::Migration
  def change
    add_column :comments, :newmessage_id, :integer
  end
end
