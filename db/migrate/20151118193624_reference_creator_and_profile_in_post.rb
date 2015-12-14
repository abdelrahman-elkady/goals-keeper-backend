class ReferenceCreatorAndProfileInPost < ActiveRecord::Migration
  def change
    remove_column :posts, :user_id

    add_reference :posts, :profile, index: true
  end
end
