class CreateWarehouses < ActiveRecord::Migration[5.2]
  def change
    create_table :warehouses do |t|
      t.string :wh_code, limit: 16, null: false, unique: true, index: true
      t.string :name
      t.string :pincode
      t.integer :max_capacity
    end
  end
end
