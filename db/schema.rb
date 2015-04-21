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

ActiveRecord::Schema.define(version: 20150415180219) do

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "game_events", force: true do |t|
    t.integer  "game_id"
    t.integer  "player_id"
    t.string   "event_code"
    t.time     "event_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "game_events", ["game_id"], name: "index_game_events_on_game_id", using: :btree
  add_index "game_events", ["player_id"], name: "index_game_events_on_player_id", using: :btree

  create_table "games", force: true do |t|
    t.date     "date"
    t.integer  "home_team_id"
    t.integer  "away_team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "timer"
    t.datetime "started_at"
    t.datetime "finished_at"
  end

  create_table "player_times", force: true do |t|
    t.integer  "game_id"
    t.integer  "player_id"
    t.time     "in_time"
    t.time     "out_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "player_times", ["game_id"], name: "index_player_times_on_game_id", using: :btree
  add_index "player_times", ["player_id"], name: "index_player_times_on_player_id", using: :btree

  create_table "players", force: true do |t|
    t.integer  "team_id"
    t.string   "first_name"
    t.string   "last_name"
    t.date     "birth_date"
    t.integer  "height"
    t.integer  "weight"
    t.integer  "number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
  end

  create_table "statistics", force: true do |t|
    t.integer "player_id"
    t.integer "game_id"
    t.integer "team_id"
    t.time    "played_time"
    t.integer "points"
    t.integer "free_throw_attempts"
    t.integer "free_throw_made"
    t.decimal "free_throw_percent",   precision: 10, scale: 0
    t.integer "field_goal_attempts"
    t.integer "field_goal_made"
    t.decimal "field_goal_percent",   precision: 10, scale: 0
    t.integer "three_point_attempts"
    t.integer "three_point_made"
    t.decimal "three_point_percent",  precision: 10, scale: 0
    t.integer "assists"
    t.integer "blockshots"
    t.integer "offencive_rebounds"
    t.integer "deffencive_rebounds"
    t.integer "losses"
    t.integer "steels"
    t.integer "fouls"
    t.integer "fouls_commited"
    t.decimal "efficiency",           precision: 10, scale: 0
  end

  create_table "teams", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
