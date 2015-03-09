class All < ActiveRecord::Migration
  def change
    create_table "jobs", force: true do |t|
      t.integer  "user_id"
      t.string   "name"
      t.float    "daily_commute"
      t.string   "industry"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "jobs", ["user_id"], name: "index_jobs_on_user_id"

    create_table "trips", force: true do |t|
      t.integer  "job_id"
      t.integer  "shift_hours"
      t.float    "starting_odometer"
      t.float    "ending_odometer"
      t.datetime "created_at"
      t.datetime "updated_at"
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
    end

    add_index "users", ["email"], name: "index_users_on_email", unique: true
    add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

    create_table "vehicles", force: true do |t|
      t.integer  "user_id"
      t.string   "make_model"
      t.integer  "year"
      t.string   "starting_odometer"
      t.boolean  "personal_usage"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  end
end
