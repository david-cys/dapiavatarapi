# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
5.times do |i|
  Profile.create(
    description: "Placeholder description #{i}",
    display_name: "Placeholder Display Name #{i}",
    email: "testemail#{i}@example.com",
  )
end
