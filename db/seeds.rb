# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

helpful = Factory.create!(name: "The Helpful Factory", operational: true, rank: 3)
helpful_store = helpful.stores.create!(name: "The Helpful Store", open: true, sold_per_month: 1234, factory_id: helpful.id)
hehe_store = helpful.stores.create!(name: "Laugh House", open: true, sold_per_month: 313, factory_id: helpful.id)

socks = Factory.create!(name: "Socks 4 u", operational: true, rank: 14)
sock_store = socks.stores.create!(name: "Sock House", open: true, sold_per_month: 333, factory_id: socks.id)