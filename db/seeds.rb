# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Creates a user
User.create(email: "user@example.com", password: "", password_confirmation: , admin: false)

# Creates an admin
User.create(email: "admin@example.com", password: , password_confirmation: , admin: true)

# Creates 5 categories
{ rock: "#FFFFFF", blues: "#0000FF", jazz: "#FF0000",  }. each do |name, color|
  Category.create(name: name, color: color)
end
