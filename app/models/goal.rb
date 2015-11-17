class Goal < ActiveRecord::Base
	has_many :posts
  belongs_to :user

	delegate :goal_posts, to: :posts
end
