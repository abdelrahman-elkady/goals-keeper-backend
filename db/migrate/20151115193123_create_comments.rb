class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :body
      add_reference :comment, :user, index: true, foreign_key: true
      add_reference :comment, :post, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
