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

ActiveRecord::Schema.define(version: 2020_10_25_043627) do

  create_table "aircraft_operators", force: :cascade do |t|
    t.integer "aircraft_id", null: false
    t.integer "operator_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["aircraft_id"], name: "index_aircraft_operators_on_aircraft_id"
    t.index ["operator_id"], name: "index_aircraft_operators_on_operator_id"
  end

  create_table "aircraft_subtypes", force: :cascade do |t|
    t.integer "aircraft_id", null: false
    t.integer "subtype_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["aircraft_id"], name: "index_aircraft_subtypes_on_aircraft_id"
    t.index ["subtype_id"], name: "index_aircraft_subtypes_on_subtype_id"
  end

  create_table "aircrafts", force: :cascade do |t|
    t.string "name"
    t.string "aircraft_type"
    t.integer "service_start"
    t.integer "units_build"
    t.decimal "unit_price"
    t.integer "origin_country_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["origin_country_id"], name: "index_aircrafts_on_origin_country_id"
  end

  create_table "operators", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "origin_countries", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pages", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.string "permalink"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "subtypes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "aircraft_operators", "aircrafts"
  add_foreign_key "aircraft_operators", "operators"
  add_foreign_key "aircraft_subtypes", "aircrafts"
  add_foreign_key "aircraft_subtypes", "subtypes"
  add_foreign_key "aircrafts", "origin_countries"
end
