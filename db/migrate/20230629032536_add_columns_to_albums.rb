class AddColumnsToAlbums < ActiveRecord::Migration[7.0]
  def change
    add_column :albums, :no_like, :integer, default: 0
    remove_column :albums, :day_of_publish, :timestamp
  end
end
