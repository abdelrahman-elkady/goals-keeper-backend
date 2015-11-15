class User < ActiveRecord::Base
  has_many :likes
  has_many :comments
  has_many :posts
  has_many :goals
end
