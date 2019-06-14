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
  { content: "Magnifique!", rating: 5 },
  { content: "Merci pour ce moment", rating: 5 },
  { content: "A très bientôt!", rating: 5 },
  { content: "Ce m'a vraiment aidé.", rating: 5 },
  { content: "Merci beaucoup!", rating: 5 },
  { content: "Je recommande vivement ce coach", rating: 5 },
  { content: "Une magnifique expérience. Merci!", rating: 5 },
  { content: "Ce site est vraiment génial!", rating: 5 },
  { content: "Ce coaching m'a vraiment ouvert des portes!", rating: 5 },
  { content: "Un grand merci!", rating: 5 },
  { content: "Quelle écoute, et quels bons conseils!!", rating: 5 },
  { content: "Très intéressant!", rating: 4 },
  { content: "Super", rating: 4 },
  { content: "Super coach!!", rating: 4 },
  { content: "Merci beaucoup!!", rating: 4 },
  { content: "Expérience très intéressante!", rating: 4 },
  { content: "J'ai enfin trouvé ma voie!", rating: 5 },
  { content: "Super coach pour trouver sa voie", rating: 5 },
  { content: "C'était très chouette. Ce coaching m'a beaucoup aidé.", rating: 4 },
  { content: "C'était très agréable. Ce coach m'a vraiment aidé!", rating: 4 },
  { content: "Intéressant...", rating: 3 },
  { content: "C'était instructif", rating: 3 },
  { content: "Ce coach est sympathique, mais il était en retard...", rating: 2 },
  { content: "Je suis déçu...", rating: 1 },
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

MALE_FIRSTNAMES = ['Gabriel', 'Louis', 'Raphaël', 'Jules', 'Adam', 'Lucas', 'Léo', 'Hugo', 'Arthur', 'Nathan', 'Paul', 'Gabin', 'Mathis', 'Axel', 'Victor', 'Antoine', 'Valentin', 'Martin', 'Marius', 'Clément', 'Baptiste', 'Maxime', 'Samuel', 'Léon', 'Augustin', 'Maxence', 'Alexandre', 'Thomas', 'Simon', 'Gaspard', 'Malo', 'Marceau', 'Alexis', 'Camille', 'Oscar', 'Mathys', 'Adrien', 'Benjamin', 'Joseph', 'William', 'Jean', 'Bastien', 'Léandre', 'Antonin', 'David', 'Charles', 'Pierre', 'Basile', 'Timothée', 'Thibault', 'Lucien', 'Auguste', 'Abel', 'Alban', 'Marcel', 'Quentin', 'Mathias', 'Corentin', 'Marin', 'Achille', 'Tristan', 'Romain', 'Nicolas', 'Daniel', 'Armand', 'Amaury', 'Lilian', 'Roméo', 'Ulysse', 'Mathieu', 'Jonas', 'Johan', 'Gustave', 'Emmanuel', 'Julien', 'Emile', 'Tim', 'Gauthier', 'Morgan', 'Anatole', 'Félix', 'Henri', 'Hector', 'Elie', 'Octave', 'Edouard', 'Anthony', 'Matthieu', 'Ange', 'Edgar', 'Gaston', 'Joachim', 'Ernest', 'Aubin', 'Justin', 'Marc', 'Georges', 'Alix', 'Louison', 'Loïc']
FEMALE_FIRSTNAMES = ['Emma', 'Louise', 'Jade', 'Alice', 'Chloé', 'Lina', 'Léa', 'Manon', 'Rose', 'Anna', 'Inès', 'Camille', 'Ambre', 'Léna', 'Zoé', 'Juliette', 'Julia', 'Lou', 'Sarah', 'Lucie', 'Jeanne', 'Romane', 'Agathe', 'Eva', 'Charlotte', 'Léonie', 'Margaux', 'Clara', 'Olivia', 'Adèle', 'Clémence', 'Capucine', 'Victoria', 'Mathilde', 'Margot', 'Iris', 'Anaïs', 'Elise', 'Victoire', 'Elsa', 'Lise', 'Lisa', 'Marie', 'Soline', 'Apolline', 'Alix', 'Gabrielle', 'Valentine', 'Pauline', 'Faustine', 'Héloïse', 'Océane', 'Mélina', 'Salomé', 'Maria', 'Constance', 'Sara', 'Elisa', 'Laura', 'Justine', 'Elina', 'Lison', 'Charline', 'Suzanne', 'Garance', 'Ninon', 'Julie', 'Andréa', 'Myriam', 'Albane', 'Céleste', 'Elya', 'Diane', 'Emilie', 'Coline', 'Cassandre', 'Mélissa', 'Clémentine', 'Sophie', 'Louison', 'Augustine', 'Elia', 'Axelle', 'Madeleine', 'Marion', 'Lucile', 'Clarisse', 'Morgane', 'Judith', 'Line', 'Aurore', 'Bérénice', 'Rachel', 'Daphné', 'Hortense', 'Amélie', 'Esther', 'Estelle', 'Flora', 'Olympe']
LASTNAMES = ['Bernard', 'Dubois', 'Thomas', 'Robert', 'Richard', 'Petit', 'Durand', 'Leroy', 'Moreau', 'Simon', 'Laurent', 'Lefebvre', 'Michel', 'Garcia', 'David', 'Bertrand', 'Roux', 'Vincent', 'Fournier', 'Morel', 'Girard', 'Andre', 'Lefevre', 'Mercier', 'Dupont', 'Lambert', 'Bonnet', 'Francois', 'Martinez', 'Roger', 'Roche', 'Roy', 'Noel', 'Meyer', 'Lucas', 'Meunier', 'Jean', 'Perez', 'Marchand', 'Dufour', 'Blanchard', 'Marie', 'Barbier', 'Brun', 'Dumas', 'Brunet', 'Schmitt', 'Leroux', 'Colin', 'Fernandez', 'Pierre', 'Renard', 'Arnaud', 'Rolland', 'Caron', 'Aubert', 'Giraud', 'Leclerc', 'Vidal', 'Legrand', 'Garnier', 'Faure', 'Rousseau', 'Blanc', 'Guerin', 'Muller', 'Henry', 'Roussel', 'Nicolas', 'Perrin', 'Morin', 'Mathieu', 'Clement', 'Gauthier', 'Dumont', 'Lopez', 'Fontaine', 'Chevalier', 'Robin', 'Masson', 'Sanchez', 'Gerard', 'Nguyen', 'Boyer', 'Denis', 'Lemaire', 'Duval', 'Joly', 'Gautier', 'Bourgeois', 'Renaud', 'Lemoine', 'Picard', 'Gaillard', 'Philippe', 'Leclercq', 'Lacroix', 'Fabre', 'Dupuis', 'Olivier', 'Rodriguez', 'Da Silva', 'Hubert', 'Louis', 'Charles', 'Guillot', 'Riviere', 'Le gall', 'Guillaume', 'Adam', 'Rey', 'Moulin', 'Gonzalez', 'Berger', 'Lecomte', 'Menard', 'Fleury', 'Deschamps', 'Carpentier']

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

COACH_DIPLOMS = [
  "Diplôme d'Etat de conseiller d'orientation-psychologue (DECOP), Institut national d'étude du travail et d'orientation professionnelle (INETOP - CNAM)",
  "Licence Sciences Humaines et Sociales mention Psychologie",
  "Master Sciences Humaines et Sociales mention Psychologie",
  "Master de Psychologie clinique",
  "Master de Psychologie du développement",
  "Master de Psychologie sociale, psychologie cognitive",
  "Master de Psychologie cognitive",
  "Formation de coaching à distance - KOREVA",
  "Diplôme d'Etat de psychologue scolaire (DEPS)"
]

DESCRIPTION_COACH = "Je propose de vous accompagner dans les moments charnières de votre vie professionnelle : transition de carrière, définition d'une nouvelle trajectoire, mais aussi perte d'emploi, reconversion ... L'approche que je propose est hybride et s’appuie sur ma formation en Psychologie et mes années de pratique dans les Ressources Humaines. Par l'intermédiaire d'un accompagnement individuel ajusté à vos besoins, nous définirons un programme sur-mesure, à votre rythme pour retrouver un souffle et avancer ensemble, en fonction de vos objectifs. En tant que Coach, je facilite ici le questionnement au sein des personnes et la prise de décision en étant un acteur du dialogue intérieur, une aide à la prise de recul et à la réflexion, dans une relation d'écoute et d'accompagnement bienveillante."

puts "creating coach Antoine"
antoine = User.new(firstname: "Antoine", lastname: "Rambert", email: "antoine.rambert@gmail.com",
  description: "Coach depuis maintenant 3 ans en cabinet, je suis passionné par mon métier. Je crois vraiment que chaque personne peut trouver un métier qui lui corresponde vraiment, le rende heureux. Je reçois sur rendez-vous, par vidéo ou à mon cabinet. N'hésitez pas à me contacter pour toute question. ",
  age: 32, password: "123456", status: "coach", hourly_price_cents: 4800, diplom: COACH_DIPLOMS.sample, speciality: "coaching personnalisé", business_expertise: "tous secteurs")
antoine.remote_avatar_url = "http://res.cloudinary.com/tootoon/image/upload/v1560420054/j5kbczylxrj07cfwhudf.jpg"
antoine.save!


puts "creating 5 male clients"
5.times do
  client = User.new(firstname: MALE_FIRSTNAMES.sample, lastname: LASTNAMES.sample, password: "123456", description: Faker::Lorem.paragraphs, age: (11..60).to_a.sample, status: "client")
  client.email = "#{client.firstname}.#{client.lastname}@email.fr"
  client.remote_avatar_url = AVATAR_URLS[:clients][:male].sample
  client.save
end

puts "creating 5 female clients"
5.times do
  client = User.new(firstname: FEMALE_FIRSTNAMES.sample, lastname: LASTNAMES.sample, password: "123456", description: Faker::Lorem.paragraphs, age: (11..60).to_a.sample, status: "client")
  client.email = "#{client.firstname}.#{client.lastname}@email.fr"
  client.remote_avatar_url = AVATAR_URLS[:clients][:female].sample
  client.save
end

puts "creating 5 male coaches"
5.times do
  coach = User.new(firstname: MALE_FIRSTNAMES.sample, lastname: LASTNAMES.sample, password: "123456", description: DESCRIPTION_COACH, diplom: COACH_DIPLOMS.sample, age: (11..60).to_a.sample, status: "coach", hourly_price_cents: (2000..8000).to_a.sample.round(-2), speciality: User::SPECIALIZATIONS.sample, business_expertise: User::BUSINESS_EXPERTISES.sample)
  coach.email = "#{coach.firstname}.#{coach.lastname}@email.fr"
  coach.remote_avatar_url = AVATAR_URLS[:coaches][:male].sample
  coach.save
end

puts "creating 5 female coaches"
5.times do
  coach = User.new(firstname: FEMALE_FIRSTNAMES.sample, lastname: LASTNAMES.sample, password: "123456", description: DESCRIPTION_COACH, diplom: COACH_DIPLOMS.sample, age: (11..60).to_a.sample, status: "coach", hourly_price_cents: (2000..8000).to_a.sample.round(-2), speciality: User::SPECIALIZATIONS.sample, business_expertise: User::BUSINESS_EXPERTISES.sample)
  coach.email = "#{coach.firstname}.#{coach.lastname}@email.fr"
  coach.remote_avatar_url = AVATAR_URLS[:coaches][:female].sample
  coach.save
end

def date_between_monday_and_friday?(date)
  %w[1 2 3 4 5].include? date.strftime('%u') #Check the rendez-vous is between monday and friday
end

def new_future_date_time_between_10_and_18(future = true)
  if future
    date = (Time.now + rand(14).days)
    until date_between_monday_and_friday?(date)
      date = (Time.now + rand(14).days)
    end
    date_string = date.to_date.to_s
  else
    date = (Time.now - rand(14).days)
    until date_between_monday_and_friday?(date)
      date = (Time.now - rand(14).days)
    end
    date_string = date.to_date.to_s
  end
  hour = " at #{rand(10..18).to_s}:00+02:00"
  date_time = DateTime.strptime("#{date_string}#{hour}", '%Y-%m-%d at %H:%M%z')
end

def create_past_booking(coach, client)
  start_hour = new_future_date_time_between_10_and_18(false)
  end_hour = start_hour + 1.hour
  booking = Booking.create(coach: coach, client: client, start_time: start_hour, end_time: end_hour, state: 'booked', video_channel: Booking::CHANNELS.sample)
  if client
    chatroom = ChatRoom.create! name: "#{coach.firstname} & #{client.firstname}", coach: coach, client: client
    Message.create! content: "Bonjour, merci pour votre réservation pour le #{booking.french_date}! Si vous avez des questions avant notre entretien je suis à votre disposition.", chat_room: chatroom, user: chatroom.coach
  end
  booking
end

def create_future_booking(coach, state = 'pending', client = nil, video_channel = nil)
  start_hour = new_future_date_time_between_10_and_18
  end_hour = start_hour + 1.hour
  booking = Booking.create(coach: coach, client: client, start_time: start_hour, end_time: end_hour, state: state, video_channel: video_channel)
  if client
    chatroom = ChatRoom.create name: "#{coach.firstname} & #{client.firstname}", coach: coach, client: client
    Message.create content: "Bonjour, merci pour votre réservation pour le #{booking.french_date}! Si vous avez des questions avant notre entretien je suis à votre disposition.", chat_room: chatroom, user: chatroom.coach
  end
  booking
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
  create_future_booking(coach, 'booked', client, Booking::CHANNELS.sample)
end

puts "creating 50 past bookings with reviews"
50.times do
 coach = User.coach.sample
 client = User.client.sample
 booking = create_past_booking(coach, client)

 Review.create!(REVIEWS_FOR_COACH.sample.merge(user: client, booking: booking))
 Review.create!(REVIEWS_FOR_CLIENT.sample.merge(user: coach, booking: booking))
end

puts "creating 5 past bookings with reviews for antoine"
5.times do
 coach = User.where(firstname: "Antoine").first
 client = User.client.sample
 booking = create_past_booking(coach, client)
 review = REVIEWS_FOR_COACH.sample
 until review[:rating] >= 4
  review = REVIEWS_FOR_COACH
end
 Review.create!(user: client, booking: booking, content: review[:content], rating: review[:rating])
 Review.create!(REVIEWS_FOR_CLIENT.sample.merge(user: coach, booking: booking))
end

puts "creating client Camille"
cam = User.new(firstname: "Camille", lastname: "Paumier", email: "campaum@email.com", description: "Je suis actuellement en réflexion sur mon avenir professionnel.", age: 26, password: "123456", status: "client")
cam.remote_avatar_url = "https://lh3.googleusercontent.com/tO4SHBKzgyAYGLAmzJEpjMfbQE0REocq3WRkqdDGcXdPXYPAxKXPN6S1Bpn0FgVaPHyJjxxK89q6WneUfA7-gS4aF5i8qnVxp7_vuTI4HQLFBJgn5TUtmzRxgXBBgej2PaAJ45DblPa7c5ufiiiS_Mu41ndcdEiWmW8boCLuGcb959qSUCF8rqbKPFdXNJat3As1nKQ4q3-7jbiX-f647q5_XlCg8F-8DAeZaKy-Udqm25QRTdyi2G9XpdDeMtIMAG4XtBN03j9-Id1T0ezVICYf4aSacccKU-W43wDGwXhlv-xRVnheMREccD7sQ-tHV9SyNR8CV5ZjpGs4SPwXZVd4DMJBvKxcddMo6iyoxDh4-LSB0XaWPi_GzC8jqJKDR55dfsDn5HrLKxXJGbHQpTe76GvuxuLqpYD6w5W6lc7-Z23qSghSW3HHXcKPykci8w_vMPGhWPDSWhZ7YK4Fg9tyKWRVTbgpZZkyPYKLcP9dMaGpZDkZoWwee_OeYPsJEpdHipNPhMHER2W1JhAZbZO8qArFnaEjP6HSc5pZewhifRnNVSAqA5x3r36i0aPfhzoZ15wEAXatYQeGIwC2lAIvr8P4FDQgG5XQq6Ph9ye9tSqFkYSEQOKefaR5rDhhOQuyEsEjoHob8ukxN9190F7x9fLkphOipB8qELQ2cZ_ZhPlFcdv62dqeRuSwMZf2OesASHJPoTrQin4zBKch4GTR=w872-h1308-no"
cam.save!
