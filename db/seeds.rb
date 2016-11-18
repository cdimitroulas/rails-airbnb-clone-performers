pictures = ["image/upload/v1479372720/Airbnb-clone/accordion-musical-instrument-handzuginstrument-musician-163823.jpg",
            "image/upload/v1479209538/Airbnb-clone/Snoop.jpg",
            "image/upload/v1479372704/Airbnb-clone/person-woman-music-musician.jpg",
            "image/upload/v1479372660/Airbnb-clone/pexels-photo-111253.jpg",
            "image/upload/v1479372635/Airbnb-clone/pexels-photo-132929.jpg",
            "image/upload/v1479372621/Airbnb-clone/fire-eaters-artist-juggler-fire-39075.jpg",
            "image/upload/v1479372611/Airbnb-clone/juggler-performer-water-sea-65297.jpg",
            "image/upload/v1479372599/Airbnb-clone/sing-singing-singer-microphone-64274.jpg",
            "image/upload/v1479372579/Airbnb-clone/pexels-photo-167519.jpg",
            "image/upload/v1479372563/Airbnb-clone/pexels-photo-167468.jpg",
            "image/upload/v1479372549/Airbnb-clone/pexels-photo-167444.jpg",
            "image/upload/v1479372535/Airbnb-clone/pexels-photo-89909.jpg",
            "image/upload/v1479372802/Airbnb-clone/man-person-red-white.jpg",
            "image/upload/v1479373066/Airbnb-clone/pexels-photo-167446.jpg",
            "image/upload/v1479208813/Airbnb-clone/gettyimages_117087793_wide-4f9cc3824e22a75519017d35ddf5fb2e54e672f1-s900-c85.jpg"]

categories = ["Rock", "Pop", "DJ", "Entertainer"]

event_types = [["Wedding", "Private party"], ["Private party", "Corporate event"], ["Private party"], ["Corporate event", "Private party", "Wedding"],
               ["Wedding", "Charity event"], ["Charity event", "Private party"], ["Charity event", "Private party", "Wedding"]]

postcode_array = ['E10 5HR', 'E6 2LA', 'CM15 0BH', 'CM5 9BG', 'CM9 8QJ', 'CM3 6PA',
  'SW19 8NG', 'SW18 1GQ', 'SW6 3DP', 'SW9 7RY', 'RH14 9EP', 'RH2 7NX', 'RH16 3PH',
  'WC1N 1NN', 'WC2N 6HY', 'WC1H 0PJ', 'S70 5JS', 'S43 2AT', 'S42 6BX', 'S8 9JF',
  'S2 3HB', 'WF14 8RA', 'WF3 3TQ', 'WF9 5JT', 'SW1V 1TQ', 'SW20 8YX', 'SW4 8BJ', 'N4 4PD',
  'N7 8PB', 'N1 1DX', 'N6 4JA', 'N1P 2WT', 'E7 8JL', 'E17 9FU', 'E1 8GN', 'E11 4BY',
  'E4 6TE', 'E2 9DL', 'M1 1HW', 'M1 2NY', 'M1 2WR', 'M1 3FR', 'M2 1DF']

cities = ['London', 'Bristol', 'Manchester', 'Oxford', 'Sheffield', 'Liverpool', 'Birmingham', 'Leeds', 'Edinburgh']

address_array = ['3 The Square High Road London E10 5HR',
'36 Streatfeild Ave London E6 2LA',
'18 Elmtree Ave Kelvedon Hatch Brentwood CM15 0BH',
'12 Onslow Gardens, Chipping Ongar Ongar CM5 9BG',
'26 Church St Tollesbury Maldon CM9 8QJ',
'Church Hill Purleigh Chelmsford CM3 6PA',
'13 Queens Rd Wimbledon London SW19 8NG',
'29 Eltringham St London SW18 1GQ',
'39 Broomhouse Ln Fulham London SW6 3DP',
'57 Foxley Square London SW9 7RY',
'45 Vineyard Path London SW14',
'132 High St Billingshurst RH14 9EP',
'6 New Causeway Reigate RH2 7NX',
'3 Hazelgrove Rd Haywards Heath RH16 3PH',
'73 Kenton St Kings Cross London WC1N 1NN',
'31 John Adam St London WC2N 6HY',
'48 Gordon Square Kings Cross London WC1H 0PJ',
'7 Bowland Cres Worsbrough Barnsley S70 5JS',
'9 Campbell Ct New Whittington Chesterfield S43 2AT',
'Ankerbold House Ankerbold Rd Old Tupton Chesterfield S42 6BX',
'68 Lees Hall Ave Sheffield S8 9JF',
'1 Woodland Cl Wickersley Rotherham S66',
'87 Slate St Sheffield S2 3HB',
'Ackworth Rd Tingley Wakefield WF3',
'44 Chadwick Ln Mirfield WF14 8RA',
'7 St Davids Cl Robin Hood Wakefield WF3 3TQ',
'16 W Moor Rd Kinsley Pontefract WF9 5JT']

50.times do
  performer = Performer.new(email: Faker::Internet.email, password: Devise.friendly_token[0,20],
                 first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,
                 phone_number: Faker::PhoneNumber.cell_phone, city: cities.sample,
                 postcode: postcode_array[rand(0..postcode_array.length)], event_types: event_types.sample,
                 category: categories.sample, hourly_rate: rand(10..60),
                 profile: "Why do you build me up (build me up) Buttercup, baby
                          Just to let me down (let me down) and mess me around
                          And then worst of all (worst of all) you never call, baby
                          When you say you will (say you will) but I love you still
                          I need you (I need you) more than anyone, darlin
                          You know that I have from the start
                          So build me up (build me up) Buttercup, don't break my heart")

  performer.write_attribute :picture, pictures.sample
  performer.disable_confirmation_email = true
  performer.save!
end

20.times do
  user = User.new!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,
              phone_number: Faker::PhoneNumber.cell_phone , address: address_array[rand(0..address_array.length)],
              email: Faker::Internet.email, password: 'password',
              profile_picture: nil )
  user.disable_confirmation_email = true
  user.save!
end

user_reviews = ["Amazing! Best performance I\'ve ever seen! Definitely recommend!",
                "Really fun performance at the weekend. Will make a great addition to my LeWagon post-project party in a few weeks.",
                "Pretty good but turned up 10 minutes late!",
                "Meh.",
                "To be honest they were not very good, I would go with someone else next time",
                "DO NOT HIRE! Terrible performance - but not the worst I've seen",
                "Can't believe they call themselves a performer, they completely ruined the wedding"]

def random_rating
  rand(2..5)
end

def correct_description(user_reviews)
  if random_rating == 5
    user_reviews[1]
  elsif random_rating == 4
    user_reviews[2]
  elsif random_rating == 3
    user_reviews[3]
  elsif random_rating == 2
    user_reviews[4]
  elsif random_rating == 1
    user_reviews[5]
  else
    user_reviews[6]
  end
end

Performer.all.each do |performer|
  rand(2..5).times do
    puts "creating a review..."
    Review.create!(user_id: User.find(rand(1..20)).id, performer_id: performer.id , rating: random_rating, title: Faker::Name.name, description: correct_description(user_reviews))
  end
end


