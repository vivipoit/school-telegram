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

ActiveRecord::Schema[8.0].define(version: 2024_10_17_194407) do
  create_table "course_students", force: :cascade do |t|
    t.integer "course_id", null: false
    t.integer "student_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_course_students_on_course_id"
    t.index ["student_id"], name: "index_course_students_on_student_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "subject"
    t.integer "teacher_id", null: false
    t.integer "teacher_assistant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "telegram_group_link"
    t.index ["teacher_assistant_id"], name: "index_courses_on_teacher_assistant_id"
    t.index ["teacher_id"], name: "index_courses_on_teacher_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "ip_address"
    t.string "user_agent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email_address", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role", limit: 1, default: 1
    t.index ["email_address"], name: "index_users_on_email_address", unique: true
  end

  add_foreign_key "course_students", "courses"
  add_foreign_key "course_students", "users", column: "student_id"
  add_foreign_key "courses", "users", column: "teacher_assistant_id"
  add_foreign_key "courses", "users", column: "teacher_id"
  add_foreign_key "sessions", "users"
end
