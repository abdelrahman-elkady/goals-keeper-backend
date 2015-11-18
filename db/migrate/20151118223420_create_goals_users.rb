class CreateGoalsUsers < ActiveRecord::Migration
  def change
    create_table :goals_users do |t|
      t.references :user
      t.references :goal
      t.timestamps null: false
    end
    add_index :goals_users, [:user_id, :goal_id]
  end
end
