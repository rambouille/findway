class ChangeAMountForBookings < ActiveRecord::Migration[5.2]
  def change
    rename_column :bookings, :amount, :amount_cents
    change_column :bookings, :amount_cents, :integer
  end
end
