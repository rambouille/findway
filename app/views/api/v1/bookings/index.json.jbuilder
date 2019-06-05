json.array! @bookings do |booking|
  if booking.client
    json.title "Avec #{booking.client.fullname}"
  else
      json.title "Séance #{booking.id} - #{(booking.end_time - booking.start_time).fdiv(3600)} h "
  end
  json.start booking.start_time.strftime("%Y-%m-%dT%H:%M:%S")
  json.end booking.end_time.strftime("%Y-%m-%dT%H:%M:%S")
  json.allDay false
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
