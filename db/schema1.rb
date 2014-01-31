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

ActiveRecord::Schema.define(version: 20140129101115) do

  create_table "appointments", force: true do |t|
    t.integer  "user_id"
    t.integer  "service_id"
    t.datetime "when"
    t.boolean  "paid",       default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "appointments", ["service_id"], name: "index_appointments_on_service_id", using: :btree
  add_index "appointments", ["user_id"], name: "index_appointments_on_user_id", using: :btree

  create_table "categories", force: true do |t|
    t.string   "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "services", force: true do |t|
    t.string   "text"
    t.integer  "category_id"
    t.boolean  "active",                                 default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "price",         precision: 10, scale: 2, default: 20.0
    t.time     "duration_time",                          default: '2000-01-01 00:00:15'
  end

  add_index "services", ["category_id"], name: "index_services_on_category_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

end
