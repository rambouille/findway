class AddVideoToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :video, :string
  end
end
