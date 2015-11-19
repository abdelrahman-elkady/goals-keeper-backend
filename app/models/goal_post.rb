class GoalPost < Post
	validates :goal, :presence => true

    belongs_to :goal
end
