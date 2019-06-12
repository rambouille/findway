json.booking_id @booking.id
json.state @booking.state
if @booking.client
  json.client_id @booking.client.id
  json.client_firstname @booking.client.firstname
  json.client_lastname @booking.client.lastname
  json.video_channel @booking.video_channel
  json.client_avatar_urls @booking.client.avatar
  json.chat_room_id @booking.chat_room.id
end
json.start @booking.start_time.strftime("%Y-%m-%dT%H:%M:%S")
json.end @booking.end_time.strftime("%Y-%m-%dT%H:%M:%S")
json.day @booking.start_time.strftime("%d-%m-%Y")
json.start_hour @booking.start_time.strftime("%H:%M")
json.end_hour @booking.end_time.strftime("%H:%M")
json.allDay false
