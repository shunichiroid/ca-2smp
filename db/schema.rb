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

ActiveRecord::Schema.define(version: 20180510061524) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "deals", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.text "image_data"
    t.decimal "original_price"
    t.decimal "offer_price"
    t.datetime "expiry"
    t.integer "quantity"
    t.integer "voucher_limit_per_user"
    t.string "charge_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "merchant_id"
    t.index ["merchant_id"], name: "index_deals_on_merchant_id"
  end

  create_table "merchants", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name"
    t.text "description"
    t.string "street"
    t.string "city"
    t.string "state"
    t.string "postcode"
    t.decimal "latitude"
    t.decimal "longitude"
    t.string "website_url"
    t.string "facebook_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "image_data"
    t.index ["user_id"], name: "index_merchants_on_user_id"
  end

  create_table "photos", force: :cascade do |t|
    t.text "image_data"
    t.bigint "merchant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["merchant_id"], name: "index_photos_on_merchant_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vouchers", force: :cascade do |t|
    t.bigint "deal_id"
    t.bigint "user_id"
    t.text "qrcode_data"
    t.string "uuid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deal_id"], name: "index_vouchers_on_deal_id"
    t.index ["user_id"], name: "index_vouchers_on_user_id"
  end

  add_foreign_key "deals", "merchants"
  add_foreign_key "merchants", "users"
  add_foreign_key "photos", "merchants"
  add_foreign_key "vouchers", "deals"
  add_foreign_key "vouchers", "users"
end
