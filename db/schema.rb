# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150522090856) do

  create_table "answers", force: :cascade do |t|
    t.string   "content"
    t.boolean  "correct"
    t.integer  "questions_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "answers", ["questions_id"], name: "index_answers_on_questions_id"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.integer  "max_question"
    t.integer  "max_time"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "exams", force: :cascade do |t|
    t.time     "time_complete"
    t.integer  "mark"
    t.integer  "status"
    t.integer  "categories_id"
    t.integer  "users_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "exams", ["categories_id"], name: "index_exams_on_categories_id"
  add_index "exams", ["users_id"], name: "index_exams_on_users_id"

  create_table "questions", force: :cascade do |t|
    t.string   "content"
    t.integer  "categories_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "questions", ["categories_id"], name: "index_questions_on_categories_id"

  create_table "results", force: :cascade do |t|
    t.integer  "questions_id"
    t.integer  "exams_id"
    t.integer  "answers_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "results", ["answers_id"], name: "index_results_on_answers_id"
  add_index "results", ["exams_id"], name: "index_results_on_exams_id"
  add_index "results", ["questions_id"], name: "index_results_on_questions_id"

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "name"
    t.string   "password"
    t.integer  "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
