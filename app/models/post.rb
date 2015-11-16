class Post < ActiveRecord::Base
    has_many :comments
    has_many :likes
    belongs_to :user 
  
    def self.types
      %w(GoalPost ProfilePost)
    end
end
