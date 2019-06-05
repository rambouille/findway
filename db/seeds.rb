if Rails.env.development?
  puts "deleting Messages"
  Message.destroy_all
  puts "deleting Reviews"
  Review.destroy_all
  puts "deleting Bookings"
  Booking.destroy_all
  puts "deleting Users"
  User.destroy_all
end

puts "creating client"
titeuf = User.new(
  firstname: "Titeuf",
  lastname: "",
  email: "titeuf@a.com",
  description: "Test pour geocoding",
  age: 45,
  password: "123456",
  status: "client"
)
titeuf.remote_avatar_url = "https://i.pinimg.com/originals/a7/6f/33/a76f33faee9ebf5390edfc298c33703f.gif"
titeuf.save!

puts "creating coach"
pascal = User.new(
  firstname: "Pascal",
  lastname:"legrandfrere",
  email: "pascal@a.com",
  description: "Salut c'est moi Pascal, ton grand frère!",
  age: 30,
  password: "123456",
  status: "coach",
  hourly_price_cents: 3400,
  speciality: "coaching personnalisé",
  business_expertise: "TOUS SECTEURS"
  )
pascal.remote_avatar_url = "https://o1.ldh.be/image/thumb/58a52af9cd703b981540caa0.jpg"
pascal.save!

puts "creating 5 bookings from coach"
b = Booking.create(
  coach: pascal,
  start_time: "06/06/2019 at 14:00",
  end_time: "06/06/2019 at 16:00",
  weekly: true)

b2 = Booking.create(
  coach: pascal,
  start_time: "08/06/2019 at 11:00",
  end_time: "08/06/2019 at 12:00",
  weekly: false)

b3 = Booking.create(
  coach: pascal,
  start_time: "08/06/2019 at 12:00",
  end_time: "08/06/2019 at 13:00",
  weekly: false)

b4 = Booking.create(
  coach: pascal,
  start_time: "08/06/2019 at 14:00",
  end_time: "08/06/2019 at 15:00",
  weekly: false)

b5 = Booking.create(
  coach: pascal,
  start_time: "08/06/2019 at 15:00",
  end_time: "08/06/2019 at 16:00",
  weekly: false)

puts "affecting booking to client"
b.client = titeuf
b.client_need = "Je suis complètement perdu. S'il vous plait aidez-moi!!"
b.video_channel = "skype"
b.state = "booked"
b.save

puts "creating message from coach"
Message.create(
  coach: pascal,
  client: titeuf,
  content:"Hello Titeuf, Soon we will have a call. Please do this test. Pascal",
  author: "coach")

puts "creating message from client"
Message.create(
  coach: pascal,
  client: titeuf,
  content:"Hi Coach, I'm doing my coach right now",
  author: "client")

puts "creating review from client"
Review.create(
  booking: b,
  user: titeuf,
  content: "Tellement un bon coach!!",
  rating: 5)

puts "creating review from coach"
Review.create(
  booking: b,
  user: pascal,
  content: "Titeuf est très gentil. Mais il n'avait pas fait les tests que je lui avais demandé...",
  rating: 4)

