class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :firstname, :string, null: false
    add_column :users, :lastname, :string, null: false
    add_column :users, :description, :text, null: false
    add_column :users, :age, :integer, null: false
    add_column :users, :status, :integer, default: 0
    add_column :users, :linkedin, :string
    add_column :users, :address, :string
    add_column :users, :latitude, :float
    add_column :users, :longitude, :float
    add_column :users, :age_range, :string
    add_column :users, :study_scope, :string
    add_column :users, :business_expertise, :string
    add_monetize :users, :hourly_price, currency: { present: false }
    add_column :users, :sype_username, :string
    add_column :users, :hangout_username, :string
    add_column :users, :facetime_username, :string
  end
end
