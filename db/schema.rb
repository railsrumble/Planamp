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

ActiveRecord::Schema.define(version: 20141018182608) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: true do |t|
    t.string   "name"
    t.integer  "weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories", ["weight"], name: "index_categories_on_weight", using: :btree

  create_table "goal_in_lists", force: true do |t|
    t.integer  "goal_id"
    t.integer  "goal_list_id"
    t.string   "aasm_state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "goal_lists", force: true do |t|
    t.integer  "user_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "goal_lists", ["user_id"], name: "index_goal_lists_on_user_id", using: :btree

  create_table "goals", force: true do |t|
    t.string   "title",                       null: false
    t.text     "description"
    t.integer  "category_id",                 null: false
    t.integer  "user_id",                     null: false
    t.boolean  "approved",    default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "shared",      default: false
  end

  add_index "goals", ["approved"], name: "index_goals_on_approved", using: :btree
  add_index "goals", ["category_id"], name: "index_goals_on_category_id", using: :btree
  add_index "goals", ["user_id"], name: "index_goals_on_user_id", using: :btree

  create_table "motivations", force: true do |t|
    t.string   "title",       null: false
    t.text     "description"
    t.string   "source",      null: false
    t.integer  "goal_id",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "name"
    t.string   "time_zone"
    t.integer  "weight"
    t.datetime "birthdate"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",                  default: false
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
