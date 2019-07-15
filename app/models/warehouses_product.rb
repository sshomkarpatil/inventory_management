class WarehousesProduct < ApplicationRecord
  DEFAULT_ITEM_COUNT = 0
  DEFAULT_LOW_ITEM_THRESHOLD = 10

  belongs_to :product
  belongs_to :warehouse

  validates :item_count, presence: true
  validates :item_count, numericality: true
  validates :low_item_threshold, presence: true
  validates :low_item_threshold, numericality: true

  validates_uniqueness_of :product, scope: :warehouse
  validates_uniqueness_of :warehouse, scope: :product

  def self.default_import_hash(product, warehouse)
    {
      product_id: product.id,
      warehouse_id: warehouse.id,
      item_count: DEFAULT_ITEM_COUNT,
      low_item_threshold: DEFAULT_LOW_ITEM_THRESHOLD
    }
  end
end
