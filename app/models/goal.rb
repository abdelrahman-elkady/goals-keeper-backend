class Goal < ActiveRecord::Base
	has_many :posts
  has_and_belongs_to_many :users

	delegate :goal_posts, to: :posts
end
