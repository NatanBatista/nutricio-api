class RemoveImageFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :image, :string
    remove_column :users, :nickname, :string
    remove_column :users, :gender, :string
    remove_column :users, :lastName, :string
  end
end
