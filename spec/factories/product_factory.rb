FactoryBot.define do
  factory :product do
    name { generate(:product_name) }
    sku
    price { rand(1..100) }
  end
end
