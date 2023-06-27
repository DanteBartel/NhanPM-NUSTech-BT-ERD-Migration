class CreateLikeAlbums < ActiveRecord::Migration[7.0]
  def change
    create_join_table :users, :albums, table_name: :like_albums do |t|

      t.timestamps
    end
  end
end
