class Product < ApplicationRecord
  has_many :warehouses_products, dependent: :destroy
  has_many :warehouses, through: :warehouses_products

  validates :sku, :name, :price, presence: true
  validates :sku, length: { is: 8 }
  validates :sku, uniqueness: true
end
