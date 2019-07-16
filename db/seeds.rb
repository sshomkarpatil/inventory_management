# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.without_callback(:create, :after, :create_warehouses_products) do
  (1..60).each { |i| product = Product.create!(name: "Sample Product #{i}", sku: 10000000 + i, price: (rand * 1000).round(2)) }
end

warehouses = ([
  { name: 'Mumbai', wh_code: 'Mum400037', pincode: '400037', max_capacity: 10_000 },
  { name: 'New Delhi', wh_code: 'ND100036', pincode: '100036', max_capacity: 10_000 },
  { name: 'Bangalore', wh_code: 'Ban200045', pincode: '200045', max_capacity: 10_000 }
])

Warehouse.without_callback(:create, :after, :create_warehouses_products) do
  warehouses.each { |warehouse| Warehouse.create!(warehouse) }
end

# Mumbai Warehouse Products
mumbai_warehouse = Warehouse.find_by(wh_code: 'Mum400037')
Product.all.each do |product|
  item_count = rand(11..50)
  mumbai_warehouse.warehouses_products.create!(product: product, item_count: item_count)
end

# Banglore Warehouse Products
bangalore_warehouse = Warehouse.find_by(wh_code: 'Ban200045')
low_threashold_product = Product.count / 3
Product.all.limit(low_threashold_product).each do |product|
  item_count = rand(1..9)
  bangalore_warehouse.warehouses_products.create!(product: product, item_count: item_count)
end
p_ids = bangalore_warehouse.products.pluck(:id)
rest_products = Product.where.not(id: p_ids)
rest_products.each do |product|
  item_count = rand(11..50)
  bangalore_warehouse.warehouses_products.create!(product: product, item_count: item_count)
end

# New Delhi Warehouse Products
new_delhi_warehouse = Warehouse.find_by(wh_code: 'ND100036')
groups = Product.all.in_groups(2)
groups[0].each do |product|
  item_count = rand(1..9)
  new_delhi_warehouse.warehouses_products.create!(product: product, item_count: item_count)
end
groups[1].each do |product|
  item_count= rand(11..50)
  new_delhi_warehouse.warehouses_products.create!(product: product, item_count: item_count)
end
