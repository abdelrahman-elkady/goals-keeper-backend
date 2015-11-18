class User < ActiveRecord::Base
  has_many :likes
  has_many :comments
  has_many :posts
  has_many :goals

  delegate :profile_posts, :goal_posts, :creator_posts, to: :posts
end
