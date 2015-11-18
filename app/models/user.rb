class User < ActiveRecord::Base
  has_many :likes
  has_many :comments
  has_and_belongs_to_many :goals

  has_many :created_posts, :class_name => 'Post', :foreign_key => 'creator_id'
  has_many :profile_posts, :class_name => 'Post', :foreign_key => 'profile_id'

  has_many :followers, :class_name => 'Following', :foreign_key => 'user_id'
  has_many :followings, :class_name => 'Following', :foreign_key => 'follower_id'

  def posts
    Post.where("creator_id = ? or profile_id = ?",id,id)
  end

end
