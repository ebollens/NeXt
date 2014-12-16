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

ActiveRecord::Schema.define(version: 20141216174323) do

  create_table "oauth2_identities", force: true do |t|
    t.string   "provider",         null: false
    t.string   "provider_user_id", null: false
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  add_index "oauth2_identities", ["provider", "provider_user_id", "deleted_at"], name: "provider_compound_key", unique: true, using: :btree
  add_index "oauth2_identities", ["user_id"], name: "index_oauth2_identities_on_user_id", using: :btree

  create_table "organizations", force: true do |t|
    t.string   "name"
    t.string   "shortname"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  add_index "organizations", ["name"], name: "index_organizations_on_name", using: :btree
  add_index "organizations", ["shortname"], name: "index_organizations_on_shortname", using: :btree

  create_table "sessions", force: true do |t|
    t.string   "session_id", null: false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_session_id", unique: true, using: :btree
  add_index "sessions", ["updated_at"], name: "index_sessions_on_updated_at", using: :btree

  create_table "users", force: true do |t|
    t.text     "email",                       null: false
    t.string   "name_first"
    t.string   "name_middle"
    t.string   "name_last",                   null: false
    t.string   "name_suffix"
    t.boolean  "super_admin", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  add_index "users", ["created_at"], name: "index_users_on_created_at", using: :btree
  add_index "users", ["name_last", "name_first", "name_middle", "name_suffix"], name: "name", using: :btree
  add_index "users", ["super_admin"], name: "index_users_on_super_admin", using: :btree

end