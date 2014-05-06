class Topic < ActiveRecord::Base
  belongs_to :board
  belongs_to :user
  validates :title, :presence => true, :length => {:maximum => 20}
  validates :content, :presence => true, :length => {:maximum => 300}
end
