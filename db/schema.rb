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

ActiveRecord::Schema[7.0].define(version: 2022_08_08_004440) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "aircraft_models", force: :cascade do |t|
    t.string "description", null: false
    t.string "maker", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "airports", force: :cascade do |t|
    t.string "icao", null: false
    t.string "name", null: false
    t.string "lat", null: false
    t.string "lon", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fleets", force: :cascade do |t|
    t.bigint "aircraft_model_id", null: false
    t.string "designator"
    t.string "cover"
    t.string "turbulence_category"
    t.bigint "location_id", null: false
    t.integer "status"
    t.bigint "hub_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["aircraft_model_id"], name: "index_fleets_on_aircraft_model_id"
    t.index ["hub_id"], name: "index_fleets_on_hub_id"
    t.index ["location_id"], name: "index_fleets_on_location_id"
  end

  create_table "fsacars_connections", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "pass"
    t.string "auth"
    t.string "version"
    t.string "lat"
    t.string "lon"
    t.string "eqpt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_fsacars_connections_on_user_id"
  end

  create_table "ratings", force: :cascade do |t|
    t.string "description"
    t.string "min_hours", null: false
    t.string "icon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "firstname"
    t.string "lastname"
    t.string "callsign"
    t.bigint "rating_id"
    t.integer "status", default: 0
    t.integer "profile", default: 0
    t.time "total_hours", default: "2000-01-01 00:00:00"
    t.integer "total_flights", default: 0
    t.string "landing_fps"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "confirmation_token", limit: 128
    t.string "remember_token", limit: 128
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["rating_id"], name: "index_users_on_rating_id"
    t.index ["remember_token"], name: "index_users_on_remember_token", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "fleets", "aircraft_models"
  add_foreign_key "fleets", "airports", column: "hub_id"
  add_foreign_key "fleets", "airports", column: "location_id"
  add_foreign_key "fsacars_connections", "users"
end
