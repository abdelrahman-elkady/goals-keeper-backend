class User < ActiveRecord::Base

  validates :first_name, presence: true

  has_many :likes
  has_many :comments
  has_and_belongs_to_many :goals

  has_many :created_posts, :class_name => 'Post', :foreign_key => 'creator_id'

  has_many :following_followers, :class_name => 'Following', :foreign_key => 'user_id'
  has_many :following_followings, :class_name => 'Following', :foreign_key => 'follower_id'

  has_many :followers, :through => :following_followers
  has_many :followings, :through => :following_followings, :source => :user

  def posts
    Post.where("creator_id = ? or profile_id = ?",id,id)
  end

end
