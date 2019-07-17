class Product < ApplicationRecord
  has_many :warehouses_products, -> { order(warehouse_id: :asc) }, dependent: :destroy, inverse_of: :product
  has_many :warehouses, -> { order(id: :asc) }, through: :warehouses_products, inverse_of: :products

  validates :sku, :name, :price, presence: true
  validates :sku, length: { is: 8 }
  validates :sku, uniqueness: true

  validates :price, numericality: true

  after_create :create_warehouses_products

  accepts_nested_attributes_for :warehouses_products

  def create_warehouses_products
    warehouses_products_records = Warehouse.all.inject([]) do |records, warehouse|
      records << WarehousesProduct.default_import_hash(self, warehouse)
    end
    self.warehouses_products.import!(warehouses_products_records, batch_size: 1000)
  end
end
