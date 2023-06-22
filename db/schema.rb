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

ActiveRecord::Schema[7.0].define(version: 2023_06_22_042840) do
  create_table "applies", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "full_name"
    t.string "email"
    t.string "cv"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "job_id"
    t.bigint "user_id"
    t.index ["job_id"], name: "index_applies_on_job_id"
    t.index ["user_id"], name: "index_applies_on_user_id"
  end

  create_table "cities", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "job_count"
    t.index ["name"], name: "index_cities_on_name", unique: true
  end

  create_table "industries", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "job_count"
    t.index ["title"], name: "index_industries_on_title", unique: true
  end

  create_table "jobs", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.text "benefit"
    t.text "company_address"
    t.string "company_district"
    t.string "company_id"
    t.string "company_name"
    t.string "company_province"
    t.text "description"
    t.string "level"
    t.string "name"
    t.text "requirements"
    t.string "salary"
    t.string "type_work"
    t.string "contact_name"
    t.string "contact_email"
    t.string "contact_phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "industry_id"
    t.bigint "city_id"
    t.index ["city_id"], name: "index_jobs_on_city_id"
    t.index ["industry_id"], name: "index_jobs_on_industry_id"
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.string "full_name"
    t.string "curriculum_vitate"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
