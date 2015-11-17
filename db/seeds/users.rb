User.create!(name:  "Justin",
             email: "adminjustin@email.com",
             password:              "adminjustin",
             password_confirmation: "adminjustin",
             role: 3
            #  activated: true,
            #  activated_at: Time.zone.now
            )

User.create!(name:  "Alon",
             email: "adminalon@email.com",
             password:              "adminalon",
             password_confirmation: "adminalon",
             role: 3
            #  activated: true,
            #  activated_at: Time.zone.now
            )

User.create!(name:  "Boss",
             email: "adminboss@email.com",
             password:              "adminboss",
             password_confirmation: "adminboss",
             role: 3
            #  activated: true,
            #  activated_at: Time.zone.now
            )

5.times do |n|
  name  = Faker::Name.name
  email_name = name.gsub(" ", "")
  email = "#{email_name}@email.com"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               role: 2
              #  activated: true,
              #  activated_at: Time.zone.now
               )
end

20.times do |n|
  name  = Faker::Name.name
  email_name = name.gsub(" ", "")
  email = "#{email_name}@email.com"
  password = "password"
  assistant_id = rand(4..8)
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               role: 1,
               assistant_id: assistant_id
              #  activated: true,
              #  activated_at: Time.zone.now
               )
end
