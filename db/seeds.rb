# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
if User.count.zero?
  User.create(id: 1, email: 'chukimthang94@gmail.com', password: '123456')
end
if GeneralSetting.count.zero?
  GeneralSetting.create(rent: 5300000, electricity_price: 3800, water_price: 30000, surcharge: 100000)
end
