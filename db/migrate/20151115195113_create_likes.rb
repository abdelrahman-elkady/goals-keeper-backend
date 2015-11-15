class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      add_reference :like, :user, index: true, foreign_key: true
      add_reference :like, :post, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
