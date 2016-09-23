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

ActiveRecord::Schema.define(version: 20160923071642) do

  create_table "products", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float    "price"
  end

  create_table "shopping_cart_addresses", force: :cascade do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "street_address"
    t.string   "city"
    t.string   "zip"
    t.string   "phone"
    t.integer  "country_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["country_id"], name: "index_shopping_cart_addresses_on_country_id"
  end

  create_table "shopping_cart_countries", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shopping_cart_coupons", force: :cascade do |t|
    t.string   "name"
    t.integer  "discount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shopping_cart_credit_cards", force: :cascade do |t|
    t.string   "number"
    t.string   "expiration_month"
    t.string   "expiration_year"
    t.string   "code"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "shopping_cart_deliveries", force: :cascade do |t|
    t.string   "name"
    t.float    "cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shopping_cart_order_items", force: :cascade do |t|
    t.integer  "count"
    t.float    "cost"
    t.integer  "order_id"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_shopping_cart_order_items_on_order_id"
    t.index ["product_id"], name: "index_shopping_cart_order_items_on_product_id"
  end

  create_table "shopping_cart_orders", force: :cascade do |t|
    t.float    "total"
    t.date     "completed_at"
    t.integer  "status"
    t.integer  "billing_address_id"
    t.integer  "shipping_address_id"
    t.integer  "delivery_id"
    t.integer  "credit_card_id"
    t.boolean  "use_billing_address"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "coupon_id"
    t.integer  "user_id"
    t.index ["billing_address_id"], name: "index_shopping_cart_orders_on_billing_address_id"
    t.index ["coupon_id"], name: "index_shopping_cart_orders_on_coupon_id"
    t.index ["credit_card_id"], name: "index_shopping_cart_orders_on_credit_card_id"
    t.index ["delivery_id"], name: "index_shopping_cart_orders_on_delivery_id"
    t.index ["shipping_address_id"], name: "index_shopping_cart_orders_on_shipping_address_id"
    t.index ["user_id"], name: "index_shopping_cart_orders_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
