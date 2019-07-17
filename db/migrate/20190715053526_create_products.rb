class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string  :sku, limit: 8, null: false, unique: true, index: true
      t.decimal :price, precision: 8, scale: 2
      t.string  :name

      t.timestamps null: false
    end
  end
end
