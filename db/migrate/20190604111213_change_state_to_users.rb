class ChangeStateToUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :bookings, :state, :integer, default: 0
  end
end
