# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name: 'test',
             email: 'test@test.com',
             password: 'test1234',
             password_confirmation: 'test1234',
             admin: true)

99.times do |n|
  name = Faker::Name.name
  email = "example-#{n + 1}@railstutorial.org"
  password = 'password'
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password)
end

users = User.order(:created_at).take(3)
50.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.microposts.create!(content: content) }
end

for i in 1..5
  for j in 1..5
    Relationship.create!(follower_id: i, followed_id: j) unless i == j
  end
end

microposts = Micropost.order(created_at: :desc).take(10)
10.times do
  content = Faker::Lorem.sentence(5)
  microposts.each { |micropost| micropost.comments.create!(content: content, user_id: 1) }
end
