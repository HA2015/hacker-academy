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

ActiveRecord::Schema.define(version: 20160907151834) do

  create_table "achieveds", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "achievement_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "achieveds", ["achievement_id"], name: "index_achieveds_on_achievement_id"
  add_index "achieveds", ["user_id"], name: "index_achieveds_on_user_id"

  create_table "achievements", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "value"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

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
    t.datetime "created_at",                                                                                                                           null: false
    t.datetime "updated_at",                                                                                                                           null: false
    t.string   "name"
    t.string   "email"
    t.string   "remember_digest"
    t.boolean  "site_admin",        default: false
    t.boolean  "team_member",       default: false
    t.boolean  "exec",              default: false
    t.string   "password_digest"
    t.text     "description",       default: "Welcome! Change your profile picture and your avatar by clicking Account > Edit in the topright corner"
    t.boolean  "sponsor",           default: false
    t.integer  "level"
    t.string   "activation_digest"
    t.boolean  "activated",         default: false
    t.datetime "activated_at"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.string   "discipline"
    t.string   "graduating"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
