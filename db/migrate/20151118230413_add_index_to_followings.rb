class AddIndexToFollowings < ActiveRecord::Migration
  def change
      add_index :followings, [:user_id, :follower_id]
  end
end
