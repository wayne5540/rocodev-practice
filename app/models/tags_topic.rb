# == Schema Information
#
# Table name: tags_topics
#
#  id         :integer          not null, primary key
#  tag_id     :integer
#  topic_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

class TagsTopic < ActiveRecord::Base
  belongs_to :tag
  belongs_to :topic
end
