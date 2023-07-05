class CreateAssociations < ActiveRecord::Migration[7.0]
  def change
    # Add column to handle association
    add_column :users, :photos_count, :integer
    add_column :users, :albums_count, :integer
    add_column :users, :followees_count, :integer
    add_column :users, :followers_count, :integer
    add_column :photos, :like_photos_count, :integer
    add_column :albums, :like_albums_count, :integer
    # Add foreign key constraints
    add_foreign_key :like_photos, :users
    add_foreign_key :like_photos, :photos
    add_foreign_key :like_albums, :users
    add_foreign_key :like_albums, :albums
    # Clean up some of the unused columns
    remove_column :photos, :no_like, :integer
    remove_column :albums, :no_like, :integer
    remove_column :users, :no_following, :integer
    remove_column :users, :no_follower, :integer
    remove_column :users, :no_photo, :integer
    remove_column :users, :no_album, :integer
    remove_column :like_photos, :created_at, :datetime
    remove_column :like_photos, :updated_at, :datetime
    remove_column :like_albums, :created_at, :datetime
    remove_column :like_albums, :updated_at, :datetime
    # Add primary key column to like_photos to fix issues where deleting a photo doesn't lead to deleting the like_photos
    add_column :like_photos, :id, :primary_key
    add_column :like_albums, :id, :primary_key
  end
end
