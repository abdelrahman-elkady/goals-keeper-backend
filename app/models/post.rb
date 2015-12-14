class Post < ActiveRecord::Base

	validates :goal, :presence => true
	validates :creator, :presence => true
	validates_length_of :text, :minimum => 5, :maximum => 50, :allow_blank => false


    has_many :comments
    has_many :likes

    belongs_to :creator, :class_name => "User", foreign_key: "creator_id"
		belongs_to :goal

end
