class AddDevise < ActiveRecord::Migration[7.0]
  def change
    ## Database authenticatable
    add_column :users, :encrypted_password, :string, null: false, default: ""
    ## Recoverable
    add_column :users, :reset_password_token, :string
    add_column :users, :reset_password_sent_at, :datetime
    ## Rememberable
    add_column :users, :remember_created_at, :datetime

    # Delete unused columns
    remove_column :users, :pass, :string, null: false
    # Change the settings of columns in users table to test devise gem
    change_column_null :users, :fname, true
    change_column_null :users, :lname, true
  end
end
