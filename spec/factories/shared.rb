FactoryBot.define do
  sequence :warehouse_name do |n|
    "Test Warehouse #{n+1}"
  end

  sequence :pincode do |n|
    (400000 + n).to_s
  end

  sequence :wh_code do |n|
    SecureRandom.hex(6).upcase
  end

  sequence :max_capacity do |n|
    rand(10000..50000)
  end

  sequence :product_name do |n|
    "Test Product #{n+1}"
  end

  sequence :sku do |n|
    SecureRandom.hex(4).upcase
  end
end
