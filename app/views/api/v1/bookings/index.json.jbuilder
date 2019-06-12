json.array! @bookings do |booking|
  json.booking_id booking.id
  json.state booking.state
  if booking.client
    json.client_id booking.client.id
    json.title booking.client.fullname
    json.client_firstname booking.client.firstname
    json.client_lastname booking.client.lastname
    json.url_avatar_client booking.client.avatar
  else
    json.title ""
  end
  json.start booking.start_time.strftime("%Y-%m-%dT%H:%M:%S")
  json.end booking.end_time.strftime("%Y-%m-%dT%H:%M:%S")
  json.date booking.start_time.strftime("%d-%m-%Y")
  json.start_hour booking.start_time.strftime("%H:%M")
  json.end_hour booking.end_time.strftime("%H:%M")
  json.allDay false
  if booking.start_time.past?
    json.color "#F4F4F4"
  elsif booking.state == "pending"
    json.color "#1282A2"
  elsif booking.state == "booked"
    json.color "#F64C72"
  elsif booking.state == "payed"
    json.color "#F64C72"
  elsif booking.state == "cancelled"
    json.color "#F64C72"
  else
    json.color "orange"
  end
end
