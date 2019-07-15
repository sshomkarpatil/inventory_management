class CreateWarehousesProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :warehouses_products do |t|
      t.integer :product_id, index: true
      t.integer :warehouse_id, index: true
      t.decimal :item_count
      t.decimal :low_item_threshold
    end
  end
end
