class Goal < ActiveRecord::Base

	validates :title , presence: true
	validates_length_of :title, :minimum => 5, :maximum => 50, :allow_blank => false

  has_many :posts
  has_and_belongs_to_many :users

end
