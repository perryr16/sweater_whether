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

ActiveRecord::Schema.define(version: 2020_08_01_213839) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dailies", force: :cascade do |t|
    t.bigint "weather_id"
    t.string "name"
    t.string "summary"
    t.string "precip"
    t.string "high"
    t.string "low"
    t.integer "index"
    t.index ["weather_id"], name: "index_dailies_on_weather_id"
  end

  create_table "hourlies", force: :cascade do |t|
    t.bigint "weather_id"
    t.string "name"
    t.string "summary"
    t.string "temp"
    t.integer "index"
    t.index ["weather_id"], name: "index_hourlies_on_weather_id"
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
    t.string "high"
    t.string "low"
    t.string "date"
    t.string "summary"
    t.string "feels_like"
    t.string "humidity"
    t.string "visibility"
    t.string "uv_index"
    t.string "sunrise"
    t.string "sunset"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "temp"
  end

  add_foreign_key "dailies", "weathers"
  add_foreign_key "hourlies", "weathers"
end
