# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(name:  "Palermo Deschamps",
             email: "palermo.deschamps@gmail.com",
             password:              "spiderman",
             password_confirmation: "spiderman",
             admin:     true,
             activated: true,
             activated_at: Time.zone.now)

User.create!(name:  "Mr.Network",
             email: "deschamps@gmail.com",
             password:              "spiderman",
             password_confirmation: "spiderman",
             admin:     false,
             activated: true,
             activated_at: Time.zone.now)