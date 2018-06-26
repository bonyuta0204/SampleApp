class AddIndexToFavorites < ActiveRecord::Migration[5.1]
  def change
    add_index :favorites, :user_id
    add_index :favorites, :micropost_id
    add_index :favorites, [:user_id, :micropost_id], unique: true
  end
end
