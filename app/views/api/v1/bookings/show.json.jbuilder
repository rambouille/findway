json.booking_id @booking.id
json.state @booking.state
if @booking.client
  json.client_id @booking.client.id
  json.client_firstname @booking.client.firstname
  json.client_lastname @booking.client.lastname
end
json.start @booking.start_time.strftime("%Y-%m-%dT%H:%M:%S")
json.end @booking.end_time.strftime("%Y-%m-%dT%H:%M:%S")
json.allDay false
