# if Rails.env.development?
  puts "deleting Messages"
  Message.destroy_all
  puts "deleting ChatRooms"
  ChatRoom.destroy_all
  puts "deleting Reviews"
  Review.destroy_all
  puts "deleting Bookings"
  Booking.destroy_all
  puts "deleting Users"
  User.destroy_all
# end

REVIEWS_FOR_COACH = [
  { content: "Une magnifique expérience. Merci!", rating: 5 },
  { content: "C'était très agréable. Ce coach m'a vraiment aidé!", rating: 4 },
  { content: "C'était très instructif", rating: 3 },
  { content: "Ce coach est sympathique, mais il était en retard...", rating: 2 },
  { content: "Je suis très déçu...", rating: 1 },
  { content: "Une perte de temps et d'argent... :(", rating: 0 }
]

REVIEWS_FOR_CLIENT = [
  { content: "Une magnifique expérience. Merci!", rating: 5 },
  { content: "Un chouette partage. Très ponctuel et agréable.", rating: 4 },
  { content: "C'était très instructif", rating: 3 },
  { content: "Ce client est sympathique, mais il était en retard...", rating: 2 },
  { content: "Je suis très déçu...", rating: 1 },
  { content: "Ne prenez pas ce client. Il était en retard et très désagréable.", rating: 0 }
]

AVATAR_URLS = {
    coaches: {
      male: ['https://i.pravatar.cc/300?img=11', 'https://i.pravatar.cc/300?img=12', 'https://i.pravatar.cc/300?img=13', 'https://i.pravatar.cc/300?img=17', 'https://i.pravatar.cc/300?img=50', 'https://i.pravatar.cc/300?img=59', 'https://i.pravatar.cc/300?img=65', 'https://i.pravatar.cc/300?img=68', 'https://i.pravatar.cc/300?img=70', 'https://www.cpacanada.ca/-/media/cpa-digital-hub/featured-images/2018/07/hub-07-19-coaches-hero-700x525.jpg'],
      female: ['https://i.pravatar.cc/300?img=16', 'https://i.pravatar.cc/300?img=23', 'https://i.pravatar.cc/300?img=35', 'https://i.pravatar.cc/300?img=44', 'https://static1.squarespace.com/static/53e37533e4b038bdcd54a993/t/540d3515e4b024050579dbab/1410151742261/www.evoke-coaching.net+-+personal+coaching', 'https://static1.squarespace.com/static/5b04610af407b439d9a1bc5b/t/5b633dee562fa74dad342fbd/1537392441984/Sasha+Farneti+Certified+Professional+Coach+for+Perfectionists+and+Women+with+controlling+behaviors+and+self-doubt?format=500w', 'https://www.kiplinger.com/kipimages/pages/13605.jpg', 'https://www.koach.net/media/cache/listing_xxlarge/uploads/listings/images/58945c5bed088563e8e3d63ad54d0adfd49329a5.jpeg', 'https://sanespaces.com/core/wp-content/uploads/2017/03/Depositphotos_43718091_l-2015.jpg', 'https://s3-media3.fl.yelpcdn.com/bphoto/g1lEVD5Q-7f20Bm6FiakGw/o.jpg', 'https://johnstonebusinesscoaching.com/wp-content/uploads/2017/05/Photo-id-Romaine-Johnstone-1-e1496139464949.jpeg', 'https://executive-coaching.co.uk/wp-content/uploads/2019/04/frances-king.jpg', 'https://www.methodacting.fr/wp-content/uploads/2018/12/Sophia-KAUSHIK_methodactingcenter.jpg' ]
    },
    clients: {
      male: ['https://i.pravatar.cc/300?img=4', 'https://i.pravatar.cc/300?img=7', 'https://i.pravatar.cc/300?img=18', 'https://i.pravatar.cc/300?img=51', 'https://i.pravatar.cc/300?img=55', 'https://cdn9.dissolve.com/p/D430_49_193/D430_49_193_1200.jpg', 'https://cdn7.dissolve.com/p/D430_49_185/D430_49_185_1200.jpg', 'https://www.menshairstylesnow.com/wp-content/uploads/2017/01/Young-Professional-Haircut-Side-Swept-Hair.jpg', 'https://s.abcnews.com/images/US/botham-jean-01-ap-jef-180907_hpMain_4x3_992.jpg', 'http://nextluxury.com/wp-content/uploads/professional-male-beard-style-ideas.jpg', 'https://ak4.picdn.net/shutterstock/videos/6305984/thumb/2.jpg', 'https://images.sudouest.fr/2014/11/12/57ebc81466a4bd6726a75e18/widescreen/1000x500/paul-etait-certain-d-avoir-reussi-son-epreuve-il-avait-raison.jpg', 'https://www.letudiant.fr/image/articleetu/christopher--m-oui-156.jpg'],
      female: ['https://i.pravatar.cc/300?img=1', 'https://i.pravatar.cc/300?img=5', 'https://i.pravatar.cc/300?img=9', 'https://i.pravatar.cc/300?img=23', 'https://i.pravatar.cc/300?img=24', 'https://i.pravatar.cc/300?img=25', 'https://i.pravatar.cc/300?img=30', 'https://i.pravatar.cc/300?img=38', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnDcMWI6r3Sn5Xl56e0tlpqU53UQY6w7-PJJ7az_SR2BTQne3d', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRxoqXcsSgj9pvqN-GXc2fFeDxLs7FQ0KnvvcBls1CU7ImYm532', 'https://cdn.goodgallery.com/4c3d0d42-c7e0-4087-b491-6e686b1f59f4/s/0800/2b2l049l/best-professional-headshots-black-professional-woman.jpg', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSunIFBLnR2fZjAn8NnbKQPVIgPfEwypEXDdKhpoD-JP8lmMcHU' , 'https://www.superprof.fr/images/annonces/professeur-home-lyceenne-terminal-donne-cours-francais-primaire-1er-lycee.jpg']
    },
}

CLIENT_AVATAR_URL = [

]

puts "creating client Titeuf"
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

puts "creating coach Pascal"
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
  business_expertise: "tous secteurs"
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
b.save!

puts ""
puts ""
puts "!! Commenter la 1ere ligne du model message (appel de broadcast_message) si bug ici !!"
puts ""
puts ""
puts "creating message from coach"
Message.create(
  chat_room: ChatRoom.where(coach: pascal, client: titeuf).first,
  user: pascal,
  content:"Hello Titeuf, Soon we will have a call. Please do this test. Pascal")

puts "creating message from client"
Message.create(
  chat_room: ChatRoom.where(coach: pascal, client: titeuf).first,
  user: titeuf,
  content:"Hi Coach, I'm doing my test right now")

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

puts "creating 5 male clients"
5.times do
  client = User.new(email: Faker::Internet.email, password: "123456", firstname: Faker::Name.male_first_name, lastname: Faker::Name.last_name, description: Faker::Lorem.paragraphs, age: (11..60).to_a.sample, status: "client")
  client.remote_avatar_url = AVATAR_URLS[:clients][:male].sample
  client.save!
end

puts "creating 5 female clients"
5.times do
  client = User.new(email: Faker::Internet.email, password: "123456", firstname: Faker::Name.female_first_name, lastname: Faker::Name.last_name, description: Faker::Lorem.paragraphs, age: (11..60).to_a.sample, status: "client")
  client.remote_avatar_url = AVATAR_URLS[:clients][:female].sample
  client.save!
end

puts "creating 5 male coaches"
5.times do
  coach = User.new(email: Faker::Internet.email, password: "123456", firstname: Faker::Name.male_first_name, lastname: Faker::Name.last_name, description: Faker::Lorem.paragraphs, age: (11..60).to_a.sample, status: "coach", hourly_price_cents: (2000..8000).to_a.sample.round(-2), speciality: User::SPECIALIZATIONS.sample, business_expertise: User::BUSINESS_EXPERTISES.sample)
  coach.remote_avatar_url = AVATAR_URLS[:coaches][:male].sample
  coach.save!
end

puts "creating 5 female coaches"
5.times do
  coach = User.new(email: Faker::Internet.email, password: "123456", firstname: Faker::Name.female_first_name, lastname: Faker::Name.last_name, description: Faker::Lorem.paragraphs, age: (11..60).to_a.sample, status: "coach", hourly_price_cents: (2000..8000).to_a.sample.round(-2), speciality: User::SPECIALIZATIONS.sample, business_expertise: User::BUSINESS_EXPERTISES.sample)
  coach.remote_avatar_url = AVATAR_URLS[:coaches][:female].sample
  coach.save!
end


def create_past_booking(coach, client)
 start_hour = (DateTime.now - rand(10).day + rand(24).hour).beginning_of_hour
 end_hour = start_hour + (1..2).to_a.shuffle.first.hour
 Booking.create!(coach: coach, client: client, start_time: start_hour, end_time: end_hour, state: 'booked', video_channel: 'skype')
end

def create_future_booking(coach, state = 'pending', client = nil, video_channel = nil)
  start_hour = (DateTime.now + rand(7).day + rand(7).hour).beginning_of_hour
  end_hour = start_hour + (1..2).to_a.shuffle.first.hour
  booking = Booking.create!(coach: coach, client: client, start_time: start_hour, end_time: end_hour, state: state, video_channel: video_channel)
end

puts "creating 100 future bookings without client"
100.times do
  coach = User.coach.sample
  create_future_booking(coach)
end

puts "creating 40 future bookings with client"
40.times do
  coach = User.coach.sample
  client = User.client.sample
  create_future_booking(coach, 'booked', client, 'skype')
end

puts "creating 50 past bookings with reviews"
50.times do
 coach = User.coach.sample
 client = User.client.sample
 booking = create_past_booking(coach, client)

 Review.create!(REVIEWS_FOR_COACH.sample.merge(user: client, booking: booking))
 Review.create!(REVIEWS_FOR_CLIENT.sample.merge(user: coach, booking: booking))
end

puts "creating 5 past bookings with reviews for Pascal"
5.times do
 coach = User.where(firstname: "Pascal").first
 client = User.client.sample
 booking = create_past_booking(coach, client)

 Review.create!(REVIEWS_FOR_COACH.sample.merge(user: client, booking: booking))
 Review.create!(REVIEWS_FOR_CLIENT.sample.merge(user: coach, booking: booking))
end

puts "creating 2 past bookings without review for Pascal"
2.times do
 coach = User.where(firstname: "Pascal").first
 client = User.client.sample
 create_past_booking(coach, client)
end
