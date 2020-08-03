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

ActiveRecord::Schema.define(version: 2020_08_03_154353) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dailies", force: :cascade do |t|
    t.bigint "weather_id"
    t.string "name"
    t.string "summary"
    t.integer "index"
    t.string "temp_units"
    t.string "precip_units"
    t.float "high"
    t.float "low"
    t.float "precip"
    t.index ["weather_id"], name: "index_dailies_on_weather_id"
  end

  create_table "hourlies", force: :cascade do |t|
    t.bigint "weather_id"
    t.string "name"
    t.string "summary"
    t.integer "index"
    t.string "temp_units"
    t.float "temp"
    t.index ["weather_id"], name: "index_hourlies_on_weather_id"
  end

  create_table "location_trails", force: :cascade do |t|
    t.bigint "location_id"
    t.bigint "trail_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_location_trails_on_location_id"
    t.index ["trail_id"], name: "index_location_trails_on_trail_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "forecast_summary"
    t.string "forecast_temp"
  end

  create_table "trails", force: :cascade do |t|
    t.string "name"
    t.string "summary"
    t.string "difficulty"
    t.string "location"
    t.string "distance_to_trail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "api_key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
  end

  create_table "weathers", force: :cascade do |t|
    t.string "city"
    t.string "state"
    t.string "country"
    t.string "date"
    t.string "summary"
    t.string "sunrise"
    t.string "sunset"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "temp_units"
    t.string "visibility_units"
    t.string "humidity_units"
    t.string "uv_index_rating"
    t.float "high"
    t.float "low"
    t.float "feels_like"
    t.float "humidity"
    t.float "visibility"
    t.float "temp"
    t.float "uv_index"
  end

  add_foreign_key "dailies", "weathers"
  add_foreign_key "hourlies", "weathers"
  add_foreign_key "location_trails", "locations"
  add_foreign_key "location_trails", "trails"
end
