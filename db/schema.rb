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

ActiveRecord::Schema.define(version: 20140221112018) do

  create_table "appointments", force: true do |t|
    t.integer  "client_id",                   null: false
    t.integer  "employee_id",                 null: false
    t.integer  "category_id",                 null: false
    t.integer  "service_id",                  null: false
    t.integer  "schedule_id",                 null: false
    t.boolean  "paid",        default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "appointments", ["category_id"], name: "index_appointments_on_category_id", using: :btree
  add_index "appointments", ["client_id"], name: "index_appointments_on_client_id", using: :btree
  add_index "appointments", ["employee_id"], name: "index_appointments_on_employee_id", using: :btree
  add_index "appointments", ["schedule_id"], name: "index_appointments_on_schedule_id", using: :btree
  add_index "appointments", ["service_id"], name: "index_appointments_on_service_id", using: :btree

  create_table "categories", force: true do |t|
    t.string   "text",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employee_services", force: true do |t|
    t.integer  "employee_id"
    t.integer  "service_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "employee_services", ["employee_id"], name: "index_employee_services_on_employee_id", using: :btree
  add_index "employee_services", ["service_id"], name: "index_employee_services_on_service_id", using: :btree

  create_table "schedule_types", force: true do |t|
    t.string "text", null: false
  end

  create_table "schedules", force: true do |t|
    t.integer  "weekly_schedule_id",                       null: false
    t.date     "date",                                     null: false
    t.string   "start_time",         limit: 5,             null: false
    t.string   "end_time",           limit: 5,             null: false
    t.integer  "schedule_type_id",             default: 1, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "schedules", ["date"], name: "index_weekly_schedules_on_date", using: :btree
  add_index "schedules", ["weekly_schedule_id"], name: "index_weekly_schedules_on_weekly_schedule_id", using: :btree

  create_table "services", force: true do |t|
    t.integer  "category_id",                                        null: false
    t.string   "text",                                               null: false
    t.boolean  "active",                              default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "price",       precision: 5, scale: 2, default: 20.0
    t.integer  "duration",                            default: 30
  end

  add_index "services", ["category_id"], name: "index_services_on_category_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name",                            null: false
    t.string   "email",                           null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           default: false
    t.boolean  "employee",        default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

  create_table "weekly_schedules", force: true do |t|
    t.integer  "employee_id",                          null: false
    t.integer  "workday_id",                           null: false
    t.string   "start_time",  limit: 5,                null: false
    t.string   "end_time",    limit: 5,                null: false
    t.boolean  "active",                default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "weekly_schedules", ["employee_id", "workday_id"], name: "index_weekly_schedules_on_employee_id_workday_id", using: :btree
  add_index "weekly_schedules", ["employee_id"], name: "index_weekly_schedules_on_employee_id", using: :btree
  add_index "weekly_schedules", ["workday_id"], name: "index_weekly_schedules_on_workday_id", using: :btree

  create_table "workdays", force: true do |t|
    t.string "text", null: false
  end

end
