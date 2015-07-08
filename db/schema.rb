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

ActiveRecord::Schema.define(version: 20150707230737) do

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "url"
    t.date     "date"
    t.time     "start_time"
    t.time     "finish_time"
    t.text     "desc"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "name"
    t.string   "email"
    t.string   "remember_digest"
    t.boolean  "site_admin",      default: false
    t.boolean  "team_member",     default: false
    t.boolean  "exec",            default: false
    t.string   "password_digest"
    t.text     "description"
    t.boolean  "sponsor",         default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
