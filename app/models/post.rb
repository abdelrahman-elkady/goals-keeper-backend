class Post < ActiveRecord::Base
    has_many :comments
    has_many :likes

    belongs_to :creator, :class_name => "User", foreign_key: "creator_id"

    scope :goal_posts, -> { where(type: 'GoalPost') }
    scope :profile_posts, -> { where(type: 'ProfilePost') }

    def self.types
      %w(GoalPost ProfilePost)
    end
end
