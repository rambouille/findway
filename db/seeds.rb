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

puts "creating 2 bookings from coach"
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

puts "affecting booking to client"
b.client = titeuf
b.client_need = "Je suis complètement perdu. S'il vous plait aidez-moi!!"
b.video_channel = "skype"
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

puts "creating 10 clients"
10.times do
  client = User.new(email: Faker::Internet.email, password: "123456", firstname: Faker::Name.first_name, lastname: Faker::Name.last_name, description: Faker::Lorem.paragraphs, age: (11..60).to_a.sample, status: "client")
  client.remote_avatar_url = Faker::Avatar.image("50x50")
  client.save
end

puts "creating 10 coaches"
10.times do
  coach = User.new(email: Faker::Internet.email, password: "123456", firstname: Faker::Name.first_name, lastname: Faker::Name.last_name, description: Faker::Lorem.paragraphs, age: (11..60).to_a.sample, status: "coach", hourly_price_cents: (2000..8000).to_a.sample, speciality: ["reconversion professionnelle", "conseiller d'orientation", "coaching personnalisé"].sample, business_expertise: [
    "AGRICULTURE - BOIS",
    "ARCHITECTURE - PAYSAGE - URBANISME",
    "ARMÉE - SÉCURITÉ",
    "ARTS - ARTISANAT - CULTURE",
    "ASSURANCE - BANQUE",
    "AUDIOVISUEL - INFORMATION - COMMUNICATION",
    "CONSTRUCTION DURABLE - BÂTIMENT ET TRAVAUX PUBLICS",
    "DROIT - ÉCONOMIE - GESTION",
    "ENSEIGNEMENT - RECHERCHE",
    "ÉNERGIES - ENVIRONNEMENT",
    "GESTION ADMINISTRATIVE - TRANSPORT - LOGISTIQUE",
    "HÔTELLERIE - RESTAURATION - TOURISME",
    "INDUSTRIES",
    "INFORMATIQUE - INTERNET",
    "RELATION CLIENT (ACCUEIL - RELATION CLIENT, COMMERCE, VENTE)",
    "SANTÉ - SOCIAL - SPORT",
    "TOUS SECTEURS"
  ].sample)
  coach.remote_avatar_url = Faker::Avatar.image("50x50")
  coach.save
end

puts "creating 10 coaches all sectors"
10.times do
  coach = User.new(email: Faker::Internet.email, password: "123456", firstname: Faker::Name.first_name, lastname: Faker::Name.last_name, description: Faker::Lorem.paragraphs, age: (11..60).to_a.sample, status: "coach", hourly_price_cents: (2000..8000).to_a.sample, speciality: ["reconversion professionnelle", "conseiller d'orientation", "coaching personnalisé"].sample, business_expertise: "TOUS SECTEURS")
  coach.remote_avatar_url = Faker::Avatar.image("50x50")
  coach.save
end

puts "creating 10 bookings"
10.times do
  start_hour = DateTime.now + rand(7).day + rand(7).hour
  end_hour = start_hour + (1..2).to_a.shuffle.first
  booking = Booking.create(coach: User.where(status: "coach").sample, start_time: start_hour, end_time: end_hour)
  booking.save
end
