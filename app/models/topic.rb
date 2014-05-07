class Topic < ActiveRecord::Base
  belongs_to :board
  belongs_to :author, :class_name => "User", :foreign_key => :user_id
  validates :title, :presence => true, :length => {:maximum => 20}
  validates :content, :presence => true, :length => {:maximum => 300}


  def editable_by?(user)
    user && user == author
  end

end
#dddd