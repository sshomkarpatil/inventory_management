class Warehouse < ApplicationRecord
  has_many :warehouses_products, dependent: :destroy
  has_many :warehouses, through: :warehouses_products

  validates :wh_code, :name, :pincode, :max_capacity presence: true
  validates :wh_code, length: { in: 4..16 }
  validates :pincode, length: { is: 6 }
end
