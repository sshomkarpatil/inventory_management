FactoryBot.define do
  factory :warehouse do
    name { generate(:warehouse_name) }
    pincode
    wh_code
    max_capacity
  end

end
