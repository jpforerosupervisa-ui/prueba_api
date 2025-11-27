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

ActiveRecord::Schema[8.1].define(version: 2025_11_26_215631) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "authorizations", primary_key: "authorization_id", id: :bigint, default: -> { "nextval('authorizations_id_seq'::regclass)" }, force: :cascade do |t|
    t.string "company_origin"
    t.string "end_time", null: false
    t.bigint "person_id", null: false
    t.string "start_time", null: false
    t.index ["person_id"], name: "index_authorizations_on_person_id"
  end

  create_table "movements", primary_key: "movement_id", id: :bigint, default: -> { "nextval('movements_id_seq'::regclass)" }, force: :cascade do |t|
    t.bigint "authorization_id", null: false
    t.string "create_time", null: false
    t.string "message", null: false
    t.string "vehicle_plate", null: false
    t.integer "way", null: false
    t.index ["authorization_id"], name: "index_movements_on_authorization_id"
  end

  create_table "people", primary_key: "person_id", id: :bigint, default: -> { "nextval('people_id_seq'::regclass)" }, force: :cascade do |t|
    t.string "first_name", null: false
    t.string "identification_number", null: false
    t.string "last_name", null: false
  end

  add_foreign_key "authorizations", "people", primary_key: "person_id"
  add_foreign_key "movements", "authorizations", primary_key: "authorization_id"
end
