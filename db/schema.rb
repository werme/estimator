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

ActiveRecord::Schema.define(version: 20131218123332) do

  create_table "estimates", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "default_rate"
    t.string   "project"
    t.string   "description"
    t.integer  "author_id"
    t.integer  "template_id"
  end

  add_index "estimates", ["author_id"], name: "index_estimates_on_author_id"
  add_index "estimates", ["template_id"], name: "index_estimates_on_template_id"

  create_table "estimates_users", force: true do |t|
    t.integer "estimate_id"
    t.integer "user_id"
  end

  create_table "notes", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "text"
    t.integer  "estimate_id"
    t.boolean  "done"
  end

  add_index "notes", ["estimate_id"], name: "index_notes_on_estimate_id"

  create_table "tasks", force: true do |t|
    t.string   "name"
    t.integer  "rate",                  default: 0
    t.integer  "hours",       limit: 5, default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "estimate_id"
    t.integer  "template_id"
    t.integer  "parent_id"
  end

  add_index "tasks", ["parent_id"], name: "index_tasks_on_parent_id"

  create_table "templates", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "task_id"
    t.string   "description"
    t.integer  "default_rate"
    t.integer  "user_id"
    t.boolean  "public"
  end

  add_index "templates", ["user_id"], name: "index_templates_on_user_id"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

end
