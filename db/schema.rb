# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_07_15_155721) do

  create_table "products", force: :cascade do |t|
    t.string "sku", limit: 8, null: false
    t.decimal "price", precision: 8, scale: 2
    t.string "name"
    t.index ["sku"], name: "index_products_on_sku"
  end

  create_table "warehouses", force: :cascade do |t|
    t.string "wh_code", limit: 16, null: false
    t.string "name"
    t.string "pincode"
    t.integer "max_capacity"
    t.index ["wh_code"], name: "index_warehouses_on_wh_code"
  end

  create_table "warehouses_products", force: :cascade do |t|
    t.integer "product_id"
    t.integer "warehouse_id"
    t.decimal "item_count"
    t.decimal "low_item_threshold"
    t.index ["product_id"], name: "index_warehouses_products_on_product_id"
    t.index ["warehouse_id"], name: "index_warehouses_products_on_warehouse_id"
  end

end
