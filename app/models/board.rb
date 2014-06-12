# == Schema Information
#
# Table name: boards
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#  user_id     :integer
#

class Board < ActiveRecord::Base
  belongs_to :owner, :class_name => "User", :foreign_key => :user_id
  has_many :topics, :dependent => :destroy
  has_many :comments, :as => :commentable
  accepts_nested_attributes_for :comments

  validates :name, :presence => true
  validates :description, :presence => true


  def generate_robot_comments
    10.times{ |i| self.comments.create(content:"robot comment #{i}") }
  end

end
