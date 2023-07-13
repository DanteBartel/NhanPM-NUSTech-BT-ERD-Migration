class RemoveColumnsPhotos < ActiveRecord::Migration[7.0]
  def change
    remove_column :photos, :photo, :text, null: false
  end
end
