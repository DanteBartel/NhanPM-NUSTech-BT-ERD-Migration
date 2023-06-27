class CreateAlbumPictures < ActiveRecord::Migration[7.0]
  def change
    create_table :album_pictures do |t|
      t.text :picture, null: false
      t.integer :album_id

      t.timestamps
    end
    # add FK to albums table
    add_foreign_key :album_pictures, :albums
  end
end
