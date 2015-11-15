class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :city
      t.string :country
      t.boolean :gender # true for male, false for female
      t.datetime :date_of_birth
      t.string :profile_picture

      t.timestamps null: false
    end
  end
end
