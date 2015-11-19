class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  validates :body, :presence => true
  validates :user, :presence => true
  validates :post, :presence => true
	validates_length_of :body, :minimum => 2, :allow_blank => false

end
