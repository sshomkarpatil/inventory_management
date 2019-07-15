# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

(1..60).each do |i|
  sku = 10000000 + i
  price = (rand * 1000).round(2)
  product = Product.new(name: "Sample Product #{i}", sku: sku, price: price)
  product.save(validate: false)
end

warehouses = ([
  { name: 'Mumbai', wh_code: 'Mum400037', pincode: '400037', max_capacity: 10_000 },
  { name: 'New Delhi', wh_code: 'ND100036', pincode: '100036', max_capacity: 10_000 },
  { name: 'Bangalore', wh_code: 'Ban200045', pincode: '200045', max_capacity: 10_000 }
])

warehouses.each do |warehouse|
  Warehouse.new(warehouse).save
end
