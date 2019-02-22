# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'bundler'
Bundler.require

30.times do
	User.create(
		first_name: Faker::Name.first_name,
		last_name: Faker::Name.last_name,
		username: Faker::Internet.username,
		description: Faker::GreekPhilosophers.quote,
		email: Faker::Internet.email,
		password: "aaaaaa"
		)
end

40.times do
	Event.create(
		title: Faker::Movies::HarryPotter.character,
		description: Faker::Lorem.paragraph(25),
		location:"Toulouse", price: rand(1..1000),
		start_date: Faker::Date.between(Date.today,	Date.today + rand(0..20).days),
		duration: 5*rand(0..100),
		admin: User.all.sample
		)
end

200.times do
	Attendance.create(
		guest: User.all.sample,
		event: Event.all.sample,
		stripe_cust_id: "jioqsrojivedrf"
		)
end