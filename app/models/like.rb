class Like < ActiveRecord::Base
  add_reference :like, :user, index: true, foreign_key: true
  add_reference :like, :post, index: true, foreign_key: true
end
