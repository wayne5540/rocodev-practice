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
  has_many :comments, :as => :commentalbe
  
  validates :name, :presence => true
  validates :description, :presence => true


end
