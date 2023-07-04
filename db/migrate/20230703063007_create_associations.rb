class CreateAssociations < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :photos_count, :integer
    add_column :users, :albums_count, :integer
    add_column :photos, :like_photos_count, :integer
    add_column :albums, :like_albums_count, :integer
    add_foreign_key :like_photos, :users
    add_foreign_key :like_photos, :photos
    add_foreign_key :like_albums, :users
    add_foreign_key :like_albums, :albums
    remove_column :like_photos, :created_at, :datetime
    remove_column :like_photos, :updated_at, :datetime
    remove_column :like_albums, :created_at, :datetime
    remove_column :like_albums, :updated_at, :datetime
  end
end
