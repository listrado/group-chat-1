# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "destroing groups and messages"

Group.destroy_all
Message.destroy_all

puts "creating groups and messages"

x = 0

10.times {

x = x+1

puts "creating group #{x}"

g = Group.create!(
  name: "group #{x}"
)

puts "creating connection"

Connection.create!(
  password: "#{x}#{x+1}#{x+2}#{x-1}",
  used: true,
  user: User.first,
  group: g
)

y = 0

puts "creating message #{y} on group #{x}"

10.times {

Message.create!(
  content: "message #{y}",
  group: g,
  user: User.first
)

y = y+1

}

}

puts "seed completed"
