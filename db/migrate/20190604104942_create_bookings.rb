class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :client
      t.references :coach
      t.datetime :start_time
      t.datetime :end_time
      t.boolean :weekly
      t.float :amount
      t.integer :video_channel
      t.text :client_need
      t.jsonb :payment
      t.integer :state

      t.timestamps
    end
  end
end
