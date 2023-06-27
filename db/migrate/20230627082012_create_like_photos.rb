class CreateLikePhotos < ActiveRecord::Migration[7.0]
  def change
    create_join_table :users, :photos, table_name: :like_photos do |t|

      t.timestamps
    end
  end
end
