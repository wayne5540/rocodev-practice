class Board < ActiveRecord::Base
  belongs_to :owner, :class_name => "User", :foreign_key => :user_id
  has_many :topics, :dependent => :destroy
  validates :name, :presence => true
  validates :description, :presence => true


  def editable_by?(user)
    user && user == owner
  end

end
