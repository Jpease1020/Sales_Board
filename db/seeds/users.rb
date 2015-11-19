User.create!(name:  "Justin",
             password:              "adminjustin",
             password_confirmation: "adminjustin",
             role: 3,
             assistant_id: 0,
             activated: true,
             activated_at: Time.zone.now
            )

User.create!(name:  "Alon",
             password:              "adminalon",
             password_confirmation: "adminalon",
             role: 3,
             assistant_id: 0,
             activated: true,
             activated_at: Time.zone.now
            )

User.create!(name:  "Boss",
             password:              "adminboss",
             password_confirmation: "adminboss",
             role: 3,
             assistant_id: 0,
             activated: true,
             activated_at: Time.zone.now
            )

5.times do |n|
  name  = Faker::Name.name
  password = "password"
  User.create!(name:  name,
               password:              password,
               password_confirmation: password,
               role: 2,
               assistant_id: 0,
               activated: true,
               activated_at: Time.zone.now
               )
end

20.times do |n|
  name  = Faker::Name.name
  password = "password"
  assistant_id = rand(4..8)
  User.create!(name:  name,
               password:              password,
               password_confirmation: password,
               role: 1,
               assistant_id: assistant_id,
               activated: true,
               activated_at: Time.zone.now
               )
end
