json.array! @bookings do |booking|
  json.title "Séance #{booking.id}"
  json.start booking.start_time.strftime("%Y-%m-%dT%H:%M:%S")
  json.end booking.end_time.strftime("%Y-%m-%dT%H:%M:%S")
  json.allDay false
  json.state booking.state
  json.color "green"
end
