class Post < ActiveRecord::Base

	validates :goal, :presence => true
	validates :user, :presence => true
	validates_length_of :text, :minimum => 5, :maximum => 50, :allow_blank => false


    has_many :comments
    has_many :likes

    belongs_to :user
		belongs_to :goal

end
