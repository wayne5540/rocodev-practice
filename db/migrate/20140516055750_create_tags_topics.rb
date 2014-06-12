class CreateTagsTopics < ActiveRecord::Migration
  def change
    create_table :tags_topics do |t|
      t.integer :tag_id
      t.integer :topic_id

      t.timestamps
    end
    add_index :tags_topics, :tag_id
    add_index :tags_topics, :topic_id
  end
end
