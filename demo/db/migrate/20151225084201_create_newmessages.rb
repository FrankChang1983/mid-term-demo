class CreateNewmessages < ActiveRecord::Migration
  def change
    create_table :newmessages do |t|
      t.string :topic
      t.integer :category_id
      t.integer :user_id
      t.text :content

      t.timestamps null: false
    end
  end
end
