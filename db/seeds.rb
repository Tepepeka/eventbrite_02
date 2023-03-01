# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Attendance.destroy_all
Event.destroy_all
User.destroy_all

# Users create
12.times do |i|
    name = Faker::Name.first_name
    password = Faker::Internet.password(min_length: 6, max_length: 10)
    User.create(
        name:name,
        email:"#{name}@yopmail.com",
        password:password,
        password_confirmation:password
    )
    puts "*"*(i+1)
    puts "#{i+1} user(s) created"
end


# Events create
24.times do |i|
    Event.create(
        start_date:Faker::Date.forward,
        title:Faker::Sports::Basketball.team,
        description:Faker::Lorem.paragraphs(number: 2),
        duration:rand(1..20)*5,
        price:rand(2..100),
        location:Faker::Address.community,
        creator_id:User.all.sample.id
    )
    puts "*"*(i+1)
    puts "#{i+1} event(s) created"
end


# Attendance create
80.times do |i|
    Attendance.create(
        user_id:User.all.sample.id,
        event_id:Event.all.sample.id,
    )
    puts "*"*(i+1)
    puts "#{i+1} attendance(s) created"
end

# Admin create
User.create(
    name:"tepepeka",
    email:"tepepeka@love",
    password:"tepepeka",
    password_confirmation:"tepepeka",
    admin: true
)

# Admin create 2
User.create(
    name:"Samuel",
    email:"samuel@love",
    password:"samuel",
    password_confirmation:"samuel",
    admin: true
)

# Admin create 3
User.create(
    name:"Kitoko",
    email:"kitoko@love",
    password:"kitoko",
    password_confirmation:"kitoko",
    admin: true
)