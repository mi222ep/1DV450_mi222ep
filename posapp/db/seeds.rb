# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(name: "john_Snow", password: "4thewall", password_confirmation: "4thewall")
User.create(name: "albin_22", password: "123456", password_confirmation: "123456")

a = Apikey.create(name:"Test apikey 1", api_key:"123",about:"About example application", user_id:"1")
User.find(1).apikeys << a

a = Apikey.create(name:"Test apikey 2", api_key:"123456",about:"About example application")
User.find(1).apikeys << a

a = Apikey.create(name:"Test apikey 3", api_key:"12345",about:"About example application")
User.find(2).apikeys << a

Creator.create(provider: "Twitter", uid: "123456", name: "testnamn")
Creator.create(provider: "Twitter", uid: "123457", name: "2testnamn")
Creator.create(provider: "Twitter", uid: "123458", name: "4testnamn")
Creator.create(provider: "Twitter", uid: "123459", name: "6testnamn")

Position.create(longitude: "34.2434", latitude: "34.5436")
Position.create(longitude: "42.3456", latitude: "24.5436")
Position.create(longitude: "62.3456", latitude: "14.5436")

Event.create(name: "testevent", about: "About testevent", event_time: "2015-02-25 13:37", creator_id: 1, position_id: 1)
Event.create(name: "2testevent", about: "About testevent", event_time: "2015-02-22 13:37", creator_id: 2, position_id: 2)
Event.create(name: "3testevent", about: "About testevent", event_time: "2015-02-21 13:37", creator_id: 3, position_id: 3)

t = Tag.create(name: "Testtagg")
tt = Tag.create(name: "2 test tag")
Event.find(1).tags << t
Event.find(2).tags << tt
Event.find(3).tags << t
