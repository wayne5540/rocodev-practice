class CreateUserCollections < ActiveRecord::Migration
  def change
    create_table :user_collections do |t|
      t.integer :user_id
      t.integer :topic_id

      t.timestamps
    end
    add_index :user_collections, :user_id
    add_index :user_collections, :topic_id
  end
end
