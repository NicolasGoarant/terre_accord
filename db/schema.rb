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

ActiveRecord::Schema[8.0].define(version: 2025_05_08_110144) do
  create_table "activities", force: :cascade do |t|
    t.string "name"
    t.string "activity_type"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.string "continent"
    t.string "score_letter_rating"
    t.decimal "ccpi_score"
    t.text "description"
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_countries_on_code"
  end

  create_table "country_activities", force: :cascade do |t|
    t.integer "country_id", null: false
    t.integer "activity_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["activity_id"], name: "index_country_activities_on_activity_id"
    t.index ["country_id"], name: "index_country_activities_on_country_id"
  end

  add_foreign_key "country_activities", "activities"
  add_foreign_key "country_activities", "countries"
end
