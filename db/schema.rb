# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_08_12_043548) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "coping_skills", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name"
    t.text "description"
    t.text "directions"
    t.integer "attempts"
    t.integer "successful_attempts"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_coping_skills_on_user_id"
  end

  create_table "diary_card_trackers", force: :cascade do |t|
    t.bigint "diary_card_id", null: false
    t.bigint "tracker_id", null: false
    t.integer "score"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["diary_card_id"], name: "index_diary_card_trackers_on_diary_card_id"
    t.index ["tracker_id"], name: "index_diary_card_trackers_on_tracker_id"
  end

  create_table "diary_cards", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.text "thoughts"
    t.text "feelings"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "entry_timestamp"
    t.index ["user_id"], name: "index_diary_cards_on_user_id"
  end

  create_table "emergency_contacts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name"
    t.string "phone_number"
    t.boolean "professional"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_emergency_contacts_on_user_id"
  end

  create_table "trackers", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_trackers_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "coping_skills", "users"
  add_foreign_key "diary_card_trackers", "diary_cards"
  add_foreign_key "diary_card_trackers", "trackers"
  add_foreign_key "diary_cards", "users"
  add_foreign_key "emergency_contacts", "users"
  add_foreign_key "trackers", "users"
end
