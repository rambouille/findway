json.array! @bookings do |booking|
  if booking.client
    json.title "Client: #{booking.client.fullname}"
  else
    json.title ""
  end
  json.start booking.start_time.strftime("%Y-%m-%dT%H:%M:%S")
  json.end booking.end_time.strftime("%Y-%m-%dT%H:%M:%S")
  json.allDay false
  json.state booking.state
  if booking.state == "pending"
    json.color "green"
  elsif booking.state == "booked"
    json.color "blue"
  elsif booking.state == "payed"
    json.color "blue"
  elsif booking.state == "passed"
    json.color "grey"
  elsif booking.state == "cancelled"
    json.color "red"
  else
    json.color "orange"
  end
end
