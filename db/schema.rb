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

ActiveRecord::Schema.define(version: 2020_07_31_010402) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "am10s", force: :cascade do |t|
    t.bigint "weather_id"
    t.string "temp"
    t.string "summary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["weather_id"], name: "index_am10s_on_weather_id"
  end

  create_table "am11s", force: :cascade do |t|
    t.bigint "weather_id"
    t.string "temp"
    t.string "summary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["weather_id"], name: "index_am11s_on_weather_id"
  end

  create_table "am12s", force: :cascade do |t|
    t.bigint "weather_id"
    t.string "temp"
    t.string "summary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["weather_id"], name: "index_am12s_on_weather_id"
  end

  create_table "am1s", force: :cascade do |t|
    t.bigint "weather_id"
    t.string "temp"
    t.string "summary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["weather_id"], name: "index_am1s_on_weather_id"
  end

  create_table "am2s", force: :cascade do |t|
    t.bigint "weather_id"
    t.string "temp"
    t.string "summary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["weather_id"], name: "index_am2s_on_weather_id"
  end

  create_table "am3s", force: :cascade do |t|
    t.bigint "weather_id"
    t.string "temp"
    t.string "summary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["weather_id"], name: "index_am3s_on_weather_id"
  end

  create_table "am4s", force: :cascade do |t|
    t.bigint "weather_id"
    t.string "temp"
    t.string "summary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["weather_id"], name: "index_am4s_on_weather_id"
  end

  create_table "am5s", force: :cascade do |t|
    t.bigint "weather_id"
    t.string "temp"
    t.string "summary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["weather_id"], name: "index_am5s_on_weather_id"
  end

  create_table "am6s", force: :cascade do |t|
    t.bigint "weather_id"
    t.string "temp"
    t.string "summary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["weather_id"], name: "index_am6s_on_weather_id"
  end

  create_table "am7s", force: :cascade do |t|
    t.bigint "weather_id"
    t.string "temp"
    t.string "summary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["weather_id"], name: "index_am7s_on_weather_id"
  end

  create_table "am8s", force: :cascade do |t|
    t.bigint "weather_id"
    t.string "temp"
    t.string "summary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["weather_id"], name: "index_am8s_on_weather_id"
  end

  create_table "am9s", force: :cascade do |t|
    t.bigint "weather_id"
    t.string "temp"
    t.string "summary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["weather_id"], name: "index_am9s_on_weather_id"
  end

  create_table "fris", force: :cascade do |t|
    t.bigint "weather_id"
    t.string "summary"
    t.string "precip"
    t.string "high"
    t.string "low"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["weather_id"], name: "index_fris_on_weather_id"
  end

  create_table "mons", force: :cascade do |t|
    t.bigint "weather_id"
    t.string "summary"
    t.string "precip"
    t.string "high"
    t.string "low"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["weather_id"], name: "index_mons_on_weather_id"
  end

  create_table "pm10s", force: :cascade do |t|
    t.bigint "weather_id"
    t.string "temp"
    t.string "summary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["weather_id"], name: "index_pm10s_on_weather_id"
  end

  create_table "pm11s", force: :cascade do |t|
    t.bigint "weather_id"
    t.string "temp"
    t.string "summary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["weather_id"], name: "index_pm11s_on_weather_id"
  end

  create_table "pm12s", force: :cascade do |t|
    t.bigint "weather_id"
    t.string "temp"
    t.string "summary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["weather_id"], name: "index_pm12s_on_weather_id"
  end

  create_table "pm1s", force: :cascade do |t|
    t.bigint "weather_id"
    t.string "temp"
    t.string "summary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["weather_id"], name: "index_pm1s_on_weather_id"
  end

  create_table "pm2s", force: :cascade do |t|
    t.bigint "weather_id"
    t.string "temp"
    t.string "summary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["weather_id"], name: "index_pm2s_on_weather_id"
  end

  create_table "pm3s", force: :cascade do |t|
    t.bigint "weather_id"
    t.string "temp"
    t.string "summary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["weather_id"], name: "index_pm3s_on_weather_id"
  end

  create_table "pm4s", force: :cascade do |t|
    t.bigint "weather_id"
    t.string "temp"
    t.string "summary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["weather_id"], name: "index_pm4s_on_weather_id"
  end

  create_table "pm5s", force: :cascade do |t|
    t.bigint "weather_id"
    t.string "temp"
    t.string "summary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["weather_id"], name: "index_pm5s_on_weather_id"
  end

  create_table "pm6s", force: :cascade do |t|
    t.bigint "weather_id"
    t.string "temp"
    t.string "summary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["weather_id"], name: "index_pm6s_on_weather_id"
  end

  create_table "pm7s", force: :cascade do |t|
    t.bigint "weather_id"
    t.string "temp"
    t.string "summary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["weather_id"], name: "index_pm7s_on_weather_id"
  end

  create_table "pm8s", force: :cascade do |t|
    t.bigint "weather_id"
    t.string "temp"
    t.string "summary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["weather_id"], name: "index_pm8s_on_weather_id"
  end

  create_table "pm9s", force: :cascade do |t|
    t.bigint "weather_id"
    t.string "temp"
    t.string "summary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["weather_id"], name: "index_pm9s_on_weather_id"
  end

  create_table "sats", force: :cascade do |t|
    t.bigint "weather_id"
    t.string "summary"
    t.string "precip"
    t.string "high"
    t.string "low"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["weather_id"], name: "index_sats_on_weather_id"
  end

  create_table "sunds", force: :cascade do |t|
    t.bigint "weather_id"
    t.string "summary"
    t.string "precip"
    t.string "high"
    t.string "low"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["weather_id"], name: "index_sunds_on_weather_id"
  end

  create_table "thurs", force: :cascade do |t|
    t.bigint "weather_id"
    t.string "summary"
    t.string "precip"
    t.string "high"
    t.string "low"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["weather_id"], name: "index_thurs_on_weather_id"
  end

  create_table "tues", force: :cascade do |t|
    t.bigint "weather_id"
    t.string "summary"
    t.string "precip"
    t.string "high"
    t.string "low"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["weather_id"], name: "index_tues_on_weather_id"
  end

  create_table "weathers", force: :cascade do |t|
    t.string "city"
    t.string "state"
    t.string "country"
    t.string "high"
    t.string "low"
    t.string "date"
    t.string "time"
    t.string "summary"
    t.string "feels_like"
    t.string "humidity"
    t.string "visibility"
    t.string "uv_index"
    t.string "sunrise"
    t.string "sunset"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "weds", force: :cascade do |t|
    t.bigint "weather_id"
    t.string "summary"
    t.string "precip"
    t.string "high"
    t.string "low"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["weather_id"], name: "index_weds_on_weather_id"
  end

  add_foreign_key "am10s", "weathers"
  add_foreign_key "am11s", "weathers"
  add_foreign_key "am12s", "weathers"
  add_foreign_key "am1s", "weathers"
  add_foreign_key "am2s", "weathers"
  add_foreign_key "am3s", "weathers"
  add_foreign_key "am4s", "weathers"
  add_foreign_key "am5s", "weathers"
  add_foreign_key "am6s", "weathers"
  add_foreign_key "am7s", "weathers"
  add_foreign_key "am8s", "weathers"
  add_foreign_key "am9s", "weathers"
  add_foreign_key "fris", "weathers"
  add_foreign_key "mons", "weathers"
  add_foreign_key "pm10s", "weathers"
  add_foreign_key "pm11s", "weathers"
  add_foreign_key "pm12s", "weathers"
  add_foreign_key "pm1s", "weathers"
  add_foreign_key "pm2s", "weathers"
  add_foreign_key "pm3s", "weathers"
  add_foreign_key "pm4s", "weathers"
  add_foreign_key "pm5s", "weathers"
  add_foreign_key "pm6s", "weathers"
  add_foreign_key "pm7s", "weathers"
  add_foreign_key "pm8s", "weathers"
  add_foreign_key "pm9s", "weathers"
  add_foreign_key "sats", "weathers"
  add_foreign_key "sunds", "weathers"
  add_foreign_key "thurs", "weathers"
  add_foreign_key "tues", "weathers"
  add_foreign_key "weds", "weathers"
end
