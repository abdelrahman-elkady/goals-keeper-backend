class Post < ActiveRecord::Base

	validates :creator, :presence => true
	validates_length_of :text, :minimum => 5, :maximum => 50, :allow_blank => false
	validates_inclusion_of :type, :in => ["GoalPost"]


    has_many :comments
    has_many :likes

    belongs_to :creator, :class_name => "User", foreign_key: "creator_id"

    scope :goal_posts, -> { where(type: 'GoalPost') }

    def self.types
      %w(GoalPost)
    end
end
