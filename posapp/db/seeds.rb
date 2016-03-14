# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(name: "john_Snow", password: "4thewall", password_confirmation: "4thewall")
User.create(name: "albin_22", password: "123456", password_confirmation: "123456")

a = Apikey.create(name:"Tankekartan", api_key:"123",about:"En karta där man kan skriva ner alla olika tankar", user_id:"1")
User.find(1).apikeys << a

a = Apikey.create(name:"Kartappen", api_key:"123456",about:"En kartapplikation")
User.find(1).apikeys << a

a = Apikey.create(name:"Appkartan", api_key:"12345",about:"En appkarta kartapp liksom")
User.find(2).apikeys << a

Creator.create(provider: "Twitter", uid: "123456", name: "Matilda")
Creator.create(provider: "Twitter", uid: "123457", name: "Amadeus")
Creator.create(provider: "Twitter", uid: "123458", name: "Kalle")
Creator.create(provider: "Twitter", uid: "123459", name: "Lisa")

Position.create(longitude: "59.305189", latitude: "17.988944")
Position.create(longitude: "59.307440", latitude: "17.994952")
Position.create(longitude: "62.3456", latitude: "14.5436")

Event.create(name: "Hemmahäng", about: "Hänga hemma och ta't lugnt", event_time: "2015-02-25 13:37", creator_id: 1, position_id: 1)
Event.create(name: "Häng i parken", about: "Umgås i Aspuddsparken och ha det skoj", event_time: "2015-02-22 13:37", creator_id: 2, position_id: 2)
Event.create(name: "Mera hemma", about: "Hänga hemma hos Matilda", event_time: "2015-02-21 13:37", creator_id: 3, position_id: 3)

t = Tag.create(name: "Hemmahäng")
tt = Tag.create(name: "Parkhäng")
Event.find(1).tags << t
Event.find(2).tags << tt
Event.find(3).tags << t
