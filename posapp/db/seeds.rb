# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(name: "john_Snow", password: "4thewall")
User.create(name: "albin", password: "123456")

a = Application.create(name:"test1", api_key:"123abc",about:"About example application")
User.find(1).applications << a

a = Application.create(name:"test2", api_key:"123abc",about:"About example application")
User.find(1).applications << a

a = Application.create(name:"test3", api_key:"123abc",about:"About example application")
User.find(1).applications << a

a = Application.create(name:"test4", api_key:"123abc",about:"About example application")
User.find(2).applications << a