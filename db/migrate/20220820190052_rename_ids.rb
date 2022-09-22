class RenameIds < ActiveRecord::Migration[7.0]
  def change
    rename_column :comments, :user_id, :author_id
    rename_column :posts, :user_id, :author_id
    rename_column :likes, :user_id, :author_id
    add_column :users, :posts_count, :integer
    add_column :posts, :comments_count, :integer
    add_column :posts, :likes_count, :integer
  end
end
