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

ActiveRecord::Schema.define(version: 20150526211237) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "filings", force: true do |t|
    t.float    "average_daily_commute"
    t.boolean  "personal_use_off_duty"
    t.boolean  "another_vehicle_personal"
    t.boolean  "has_evidence"
    t.boolean  "written_evidence"
    t.integer  "user_id"
    t.integer  "for_year"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "filings", ["user_id"], name: "index_filings_on_user_id", using: :btree

  create_table "jobs", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.float    "daily_commute"
    t.string   "industry"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "jobs", ["user_id"], name: "index_jobs_on_user_id", using: :btree

  create_table "trips", force: true do |t|
    t.integer  "job_id"
    t.integer  "shift_hours"
    t.float    "starting_odometer"
    t.float    "ending_odometer"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "vehicle_id"
    t.boolean  "notified",          default: false
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "phone"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "vehicles", force: true do |t|
    t.integer  "user_id"
    t.string   "make_model"
    t.integer  "year"
    t.string   "starting_odometer"
    t.boolean  "personal_usage"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "year_ending_odometers", force: true do |t|
    t.integer  "year"
    t.integer  "reading"
    t.integer  "vehicle_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "year_ending_odometers", ["vehicle_id"], name: "index_year_ending_odometers_on_vehicle_id", using: :btree

end
