class WarehousesProduct < ApplicationRecord
  belongs_to :product
  belongs_to :warehouse

  validates :item_count, presence: true
  validates :item_count, numericality: true
  validates :low_item_threshold, presence: true
  validates :low_item_threshold, numericality: true

  
end
