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

ActiveRecord::Schema[7.1].define(version: 2023_12_27_032458) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "gift_exchange_users", force: :cascade do |t|
    t.bigint "gift_exchange_id", null: false
    t.bigint "participant_id", null: false
    t.index ["gift_exchange_id"], name: "index_gift_exchange_users_on_gift_exchange_id"
    t.index ["participant_id"], name: "index_gift_exchange_users_on_participant_id"
  end

  create_table "gift_exchanges", force: :cascade do |t|
    t.bigint "owner_id", null: false
    t.string "name", default: "", null: false
    t.string "description", default: "", null: false
    t.date "event_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_gift_exchanges_on_owner_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "wish_lists", primary_key: ["participant_id", "gift_exchange_id"], force: :cascade do |t|
    t.bigint "participant_id", null: false
    t.bigint "gift_exchange_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gift_exchange_id"], name: "index_wish_lists_on_gift_exchange_id"
    t.index ["participant_id"], name: "index_wish_lists_on_participant_id"
  end

  add_foreign_key "gift_exchange_users", "gift_exchanges"
  add_foreign_key "gift_exchange_users", "users", column: "participant_id"
  add_foreign_key "gift_exchanges", "users", column: "owner_id"
  add_foreign_key "wish_lists", "gift_exchanges"
  add_foreign_key "wish_lists", "users", column: "participant_id"
end
