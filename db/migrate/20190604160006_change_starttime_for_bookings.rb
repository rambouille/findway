class ChangeStarttimeForBookings < ActiveRecord::Migration[5.2]
  def change
    change_column :bookings, :start_time, null: false
    change_column :bookings, :end_time, null: false
  end
end
