class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :text
      add_reference :comment, :post, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
