class Warehouse < ApplicationRecord
  DEFAULT_LOW_ITEM_THRESHOLD = 10

  has_many :warehouses_products, dependent: :destroy
  has_many :products, through: :warehouses_products

  validates :wh_code, :name, :pincode, :max_capacity, presence: true
  validates :max_capacity, numericality: { only_integer: true }
  validates :wh_code, length: { in: 4..16 }
  validates :pincode, length: { is: 6 }

  after_create :create_warehouses_products

  def create_warehouses_products
    warehouses_products_records = Product.all.inject([]) do |records, product|
      records << WarehousesProduct.default_import_hash(product, self)
    end
    self.warehouses_products.import!(warehouses_products_records, batch_size: 1000)
  end
end
