class RemoveAvatarFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :avatar, :text
  end
end
