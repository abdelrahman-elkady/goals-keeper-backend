class User < ActiveRecord::Base
  has_many :likes
  has_many :comments
  has_many :goals

  has_many :created_posts, :class_name => 'Post', :foreign_key => 'creator_id'
  has_many :profile_posts, :class_name => 'Post', :foreign_key => 'profile_id'


  delegate :profile_posts, :goal_posts, :creator_posts, to: :posts
end
