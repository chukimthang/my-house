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

ActiveRecord::Schema[7.0].define(version: 2025_04_26_142137) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bills", force: :cascade do |t|
    t.integer "electricity_quantity", default: 0, null: false
    t.integer "water_quantity", default: 0, null: false
    t.integer "electricity_cost", default: 0, null: false
    t.integer "water_cost", default: 0, null: false
    t.integer "surcharge_fee", default: 1, null: false
    t.integer "total_amount", default: 0, null: false
    t.bigint "meter_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "rent", default: 0, null: false
    t.integer "electricity_unit_price", default: 0, null: false
    t.integer "water_unit_price", default: 0, null: false
    t.integer "surcharge_per_person", default: 0, null: false
    t.index ["meter_id"], name: "index_bills_on_meter_id"
  end

  create_table "general_settings", force: :cascade do |t|
    t.integer "rent", default: 0, null: false
    t.integer "electricity_price", default: 0, null: false
    t.integer "water_price", default: 0, null: false
    t.integer "surcharge", default: 0, null: false
    t.string "room_name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gold_investments", force: :cascade do |t|
    t.decimal "number_of_chi", precision: 8, scale: 2, default: "1.0", null: false
    t.integer "unit_price", default: 0, null: false
    t.date "transaction_date"
    t.integer "transaction_type", default: 0, null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meters", force: :cascade do |t|
    t.date "month_used", null: false
    t.integer "electricity_index", default: 0, null: false
    t.integer "water_index", default: 0, null: false
    t.integer "amount_of_members", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "savings_accounts", force: :cascade do |t|
    t.date "savings_date"
    t.decimal "sacombank_amount", precision: 15, scale: 2, default: "0.0", null: false
    t.decimal "tpbank_amount", precision: 15, scale: 2, default: "0.0", null: false
    t.decimal "vietcombank_amount", precision: 15, scale: 2, default: "0.0", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
