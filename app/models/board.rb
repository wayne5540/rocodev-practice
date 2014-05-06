class Board < ActiveRecord::Base
  has_many :topics
  validates :name, :presence => true
  validates :description, :presence => true
end
