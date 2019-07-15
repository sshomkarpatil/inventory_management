class Product < ApplicationRecord
  has_many :warehouses_products, dependent: :destroy
  has_many :warehouses, through: :warehouses_products

  validates :sku, :name, :price, presence: true
  validates :sku, length: { is: 8 }
  validates :sku, uniqueness: true

  after_create :create_warehouses_products

  def create_warehouses_products
    warehouses_products_records = Warehouse.all.inject([]) do |records, warehouse|
      records << WarehousesProduct.default_import_hash(self, warehouse)
    end
    self.warehouses_products.import!(warehouses_products_records, batch_size: 1000)
  end
end
