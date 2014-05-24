# == Schema Information
#
# Table name: topics
#
#  id                  :integer          not null, primary key
#  title               :string(255)
#  content             :text
#  user_id             :integer
#  board_id            :integer
#  created_at          :datetime
#  updated_at          :datetime
#  avatar_file_name    :string(255)
#  avatar_content_type :string(255)
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#  views_count         :integer          default(0)
#

class Topic < ActiveRecord::Base
  belongs_to :board
  belongs_to :author, :class_name => "User", :foreign_key => :user_id
  has_many :tags_topics, :dependent => :destroy
  has_many :tags, :through => :tags_topics
  validates :title, :presence => true, :length => {:maximum => 20}
  validates :content, :presence => true, :length => {:maximum => 300}


  #paperclips
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/assets/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  attr_accessor :remove_avatar

  before_save :delete_avatar, if: -> { remove_avatar == true && !avatar_updated_at_changed? }


  scope :sort_by_views_count, -> {order("views_count DESC")}
  scope :recent, -> {order("created_at")}
  scope :in_tag, -> (tag_id) {joins(:tags).where(:tags => {:id => tag_id})}

  def editable_by?(user)
    user && user == author
  end

private
  
  def delete_avatar
    self.avatar = nil
  end

end
