class ChangeValidationUser < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :firstname, :string
    change_column :users, :lastname, :string
    change_column :users, :age, :integer
    change_column :users, :description, :text
  end
end
