pictures = ["http://res.cloudinary.com/dplnt2ozo/image/upload/v1479209534/Airbnb-clone/AliciaKeys.jpg",
            "http://res.cloudinary.com/dplnt2ozo/image/upload/v1479209538/Airbnb-clone/Snoop.jpg",
            "http://res.cloudinary.com/dplnt2ozo/image/upload/v1479209531/Airbnb-clone/Rihana.jpg",
            "https://cloudinary.com/console/media_library#/dialog/image/upload/Airbnb-clone/JustinB",
            "http://res.cloudinary.com/dplnt2ozo/image/upload/v1479209526/Airbnb-clone/U2.jpg",
            "http://res.cloudinary.com/dplnt2ozo/image/upload/v1479208813/Airbnb-clone/gettyimages_117087793_wide-4f9cc3824e22a75519017d35ddf5fb2e54e672f1-s900-c85.jpg"]
categories = ["Rock", "Pop", "DJ", "Entertainers"]

20.times do
  Performer.create(email: Faker::Internet.email, password: Devise.friendly_token[0,20],
                 first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,
                 phone_number: Faker::PhoneNumber.cell_phone , city: Faker::Address.city,
                 picture: pictures.sample, category: categories.sample)
end
