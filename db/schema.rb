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

ActiveRecord::Schema.define(version: 2022_03_19_143937) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "objectives", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name"
    t.date "deadline"
    t.integer "steps_count", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "steps_finish", default: 0
    t.index ["user_id"], name: "index_objectives_on_user_id"
  end

  create_table "steps", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name"
    t.date "deadline"
    t.text "description", default: ""
    t.boolean "done", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "objective_id", null: false
    t.index ["objective_id"], name: "index_steps_on_objective_id"
    t.index ["user_id"], name: "index_steps_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "objectives", "users"
  add_foreign_key "steps", "objectives"
  add_foreign_key "steps", "users"
end
