class Goal < ActiveRecord::Base
	has_many :posts
  belongs_to :user

	delegate :profile_posts, :goal_posts, to: :posts
end
