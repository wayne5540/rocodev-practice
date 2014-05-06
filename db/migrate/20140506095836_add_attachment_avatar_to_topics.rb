class AddAttachmentAvatarToTopics < ActiveRecord::Migration
  def self.up
    change_table :topics do |t|
      t.attachment :avatar
    end
  end

  def self.down
    drop_attached_file :topics, :avatar
  end
end
