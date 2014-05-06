class Topic < ActiveRecord::Base
  belongs_to :board
  validates :title, :presence => true, :length => {:maximum => 20}
  validates :content, :presence => true, :length => {:maximum => 300}
end
