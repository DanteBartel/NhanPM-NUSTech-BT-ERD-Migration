class AddColumnsToPhotos < ActiveRecord::Migration[7.0]
  def change
    add_column :photos, :no_like, :integer, default: 0
    remove_column :photos, :day_of_publish, :timestamp
  end
end
