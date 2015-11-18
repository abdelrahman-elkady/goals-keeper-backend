class User < ActiveRecord::Base
  has_many :likes
  has_many :comments
  has_many :goals

  has_many :created_posts, :class_name => 'Post', :foreign_key => 'creator_id'
  has_many :goal_posts, :class_name => 'GoalPost', :foreign_key => 'creator_id'
  has_many :profile_posts, :class_name => 'ProfilePost', :foreign_key => 'profile_id'

  def posts
    Post.where("creator_id = ? or profile_id = ?",id,id)
  end

end
