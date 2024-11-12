require 'faker'
User.destroy_all
Patient.destroy_all

doctor = User.create(email: 'doctor@hellodoctor.com', password: 'password12345', role: 1)
receptionist1 = User.create!(email:'receptionist1@hellodoctor.com', password: 'password12345')
receptionist2 = User.create!(email:'receptionist2@hellodoctor.com', password: 'password12345')

receptionists = User.where(role: :receptionist)

150.times do 

    Patient.create!(  
     first_name:Faker::Name.first_name,
     last_name:Faker::Name.last_name,
     birthdate:Faker::Date.birthday(min_age: 10, max_age: 75),
     sex:['male', 'female'].sample,
     address_line1:Faker::Address.street_name,
     address_line2:Faker::Address.community,
     city:Faker::Address.city,
     state:Faker::Address.state,
     country:Faker::Address.country,
     phone:"#{rand(5000000000..7000000000)}",
     email:Faker::Internet.email,
    created_at:Faker::Date.between(from: 3.years.ago, to: 20.days.ago) ,
    updated_at:Faker::Date.between(from: 10.days.ago, to: 1.days.ago),
   user: receptionists.sample,
    )
end