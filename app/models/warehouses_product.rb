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

  before_validation :set_default_item_count, :set_default_low_item_threshold

  def self.default_import_hash(product, warehouse)
    {
      product_id: product.id,
      warehouse_id: warehouse.id,
      item_count: DEFAULT_ITEM_COUNT,
      low_item_threshold: DEFAULT_LOW_ITEM_THRESHOLD
    }
  end

  def set_default_item_count
    self.item_count = DEFAULT_ITEM_COUNT if self.item_count.blank?
  end

  def set_default_low_item_threshold
    self.low_item_threshold = DEFAULT_LOW_ITEM_THRESHOLD if self.low_item_threshold.blank?
  end
end
