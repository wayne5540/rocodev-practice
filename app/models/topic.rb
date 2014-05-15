class Topic < ActiveRecord::Base
  belongs_to :board
  belongs_to :author, :class_name => "User", :foreign_key => :user_id
  validates :title, :presence => true, :length => {:maximum => 20}
  validates :content, :presence => true, :length => {:maximum => 300}


  #paperclips
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/assets/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  attr_accessor :remove_avatar

  before_save :delete_avatar, if: ->{ remove_avatar == true && !avatar_updated_at_changed? }


  scope :pop, -> {order("views_count DESC")}

  def editable_by?(user)
    user && user == author
  end

private
  
  def delete_avatar
    self.avatar = nil
  end

end
