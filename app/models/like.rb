class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  validates :user, :presence => true
  validates :post, :presence => true
end
