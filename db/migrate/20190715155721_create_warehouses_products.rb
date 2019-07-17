class CreateWarehousesProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :warehouses_products do |t|
      t.integer :product_id, index: true
      t.integer :warehouse_id, index: true
      t.integer :item_count
      t.integer :low_item_threshold

      t.timestamps null: false
    end
  end
end
