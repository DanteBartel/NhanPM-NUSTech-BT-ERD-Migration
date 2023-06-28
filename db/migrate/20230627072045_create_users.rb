class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :fname, null: false
      t.string :lname, null: false
      t.string :email, null: false
      t.string :pass, null: false
      t.text :avatar
      t.integer :no_photo, default: 0
      t.integer :no_album, default: 0
      t.integer :no_following, default: 0
      t.integer :no_follower, default: 0
      t.timestamp :last_log_in
      t.boolean :is_active, default: true    # status, but using this name with boolean for more clarity

      t.timestamps
    end
  end
end
