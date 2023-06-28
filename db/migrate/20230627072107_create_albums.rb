class CreateAlbums < ActiveRecord::Migration[7.0]
  def change
    create_table :albums do |t|
      t.text :title, null: false
      t.text :description, null: false
      t.boolean :is_public, default: true    # This is share mode
      t.timestamp :day_of_publish
      t.integer :no_picture, default: 0
      t.integer :no_like, default: 0
      t.integer :user_id

      t.timestamps
    end
    # FK to users table
    add_foreign_key :albums, :users
  end
end
