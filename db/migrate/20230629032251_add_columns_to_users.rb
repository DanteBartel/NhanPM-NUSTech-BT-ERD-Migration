class AddColumnsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :no_following, :integer, default: 0
    add_column :users, :no_follower, :integer, default: 0
    add_column :users, :is_admin, :boolean, default: false
  end
end
