class ChangeStarttimeForBookings < ActiveRecord::Migration[5.2]
  def change
    change_column :bookings, :start_time, :datetime, null: false
    change_column :bookings, :end_time, :datetime, null: false
  end
end
