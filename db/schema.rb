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

ActiveRecord::Schema[7.0].define(version: 2023_05_17_062631) do
  create_table "cities", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    # t.string "work_place_id"
    t.string "work_place"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "industries", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    # t.string "category_id"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jobs", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.text "benefit"
    t.string "category_id"
    t.text "company_address"
    t.string "company_district"
    t.string "company_id"
    t.string "company_name"
    t.string "company_province"
    t.text "description"
    t.string "level"
    t.text "name"
    t.text "requirements"
    t.string "salary"
    t.string "type_work"
    t.string "contact_name"
    t.string "contact_email"
    t.string "contact_phone"
    t.string "work_place_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
