class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :text
      t.string :type
      t.boolean :private ,default: false
      t.references :user, index: true, foreign_key: true
      t.references :goal, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
