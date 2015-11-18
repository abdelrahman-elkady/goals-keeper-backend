class Post < ActiveRecord::Base
    has_many :comments
    has_many :likes
    belongs_to :goal

    belongs_to :creator, :class_name => "User", foreign_key: "creator_id"
    belongs_to :profile, :class_name => "User", foreign_key: "profile_id"

    scope :goal_posts, -> { where(type: 'GoalPost') }
    scope :profile_posts, -> { where(type: 'ProfilePost') }
    scope :creator_posts, ->(user_id) { where(creator_id: user_id) }

    def self.types
      %w(GoalPost ProfilePost)
    end
end
