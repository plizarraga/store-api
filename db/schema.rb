# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_12_09_002106) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "street", null: false
    t.string "city", null: false
    t.string "state", null: false
    t.string "zipcode", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "delivery_methods", force: :cascade do |t|
    t.string "short_name"
    t.string "description"
    t.string "delivery_time"
    t.decimal "price", precision: 5, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_items", force: :cascade do |t|
    t.integer "product_item_id"
    t.string "product_itme_name"
    t.string "product_item_picture_url"
    t.decimal "price", precision: 5, scale: 2, null: false
    t.integer "quantity", null: false
    t.bigint "order_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_items_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "buyer_email", null: false
    t.date "order_date", null: false
    t.string "ship_to_address_first_name", null: false
    t.string "ship_to_address_last_name", null: false
    t.string "ship_to_address_street", null: false
    t.string "ship_to_address_city", null: false
    t.string "ship_to_address_state", null: false
    t.string "ship_to_address_zipcode", null: false
    t.bigint "delivery_method_id", null: false
    t.decimal "subtotal", null: false
    t.integer "status", default: 0, null: false
    t.integer "payment_intent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["delivery_method_id"], name: "index_orders_on_delivery_method_id"
  end

  create_table "product_brands", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_product_brands_on_name", unique: true
  end

  create_table "product_types", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_product_types_on_name", unique: true
  end

  create_table "products", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.text "description", default: ""
    t.decimal "price", precision: 5, scale: 2
    t.string "picture_url", default: ""
    t.bigint "product_type_id", null: false
    t.bigint "product_brand_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_products_on_name", unique: true
    t.index ["product_brand_id"], name: "index_products_on_product_brand_id"
    t.index ["product_type_id"], name: "index_products_on_product_type_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "name", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "addresses", "users"
  add_foreign_key "order_items", "orders"
  add_foreign_key "orders", "delivery_methods"
  add_foreign_key "products", "product_brands"
  add_foreign_key "products", "product_types"
end
