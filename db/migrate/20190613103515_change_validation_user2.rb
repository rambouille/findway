class ChangeValidationUser2 < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :firstname, :string, null: true
    change_column :users, :lastname, :string, null: true
    change_column :users, :age, :integer, null: true
    change_column :users, :description, :text, null: true
  end
end
