class CreatePhotos < ActiveRecord::Migration[7.0]
  def change
    create_table :photos do |t|
      t.text :title, null: false
      t.text :description, null: false
      t.boolean :is_public, default: true    # This is share mode
      t.timestamp :day_of_publish
      t.text :photo, null: false
      t.integer :user_id

      t.timestamps
    end
    # FK to users table
    add_foreign_key :photos, :users
  end
end
