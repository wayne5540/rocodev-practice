# == Schema Information
#
# Table name: user_collections
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  topic_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

class UserCollection < ActiveRecord::Base
  belongs_to :user
  belongs_to :topic
end
