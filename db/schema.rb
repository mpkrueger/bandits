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

ActiveRecord::Schema.define(version: 20160917042920) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "colleges", force: :cascade do |t|
    t.integer  "goal_id"
    t.string   "kid_name"
    t.integer  "kid_age"
    t.integer  "cost_estimate"
    t.decimal  "percentage_to_pay"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["goal_id"], name: "index_colleges_on_goal_id", using: :btree
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "topic_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "message"
    t.integer  "goal_id"
    t.integer  "user_id"
    t.index ["goal_id"], name: "index_comments_on_goal_id", using: :btree
    t.index ["topic_id"], name: "index_comments_on_topic_id", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "custom_goals", force: :cascade do |t|
    t.integer  "goal_id"
    t.string   "description"
    t.date     "date"
    t.integer  "target_amount"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["goal_id"], name: "index_custom_goals_on_goal_id", using: :btree
  end

  create_table "emergency_funds", force: :cascade do |t|
    t.integer  "goal_id"
    t.date     "date"
    t.integer  "monthly_expenses"
    t.integer  "num_months"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["goal_id"], name: "index_emergency_funds_on_goal_id", using: :btree
  end

  create_table "families", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "feedbacks", force: :cascade do |t|
    t.string   "approach",   default: [],              array: true
    t.text     "thoughts"
    t.integer  "goal_id"
    t.integer  "user_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["goal_id"], name: "index_feedbacks_on_goal_id", using: :btree
    t.index ["user_id"], name: "index_feedbacks_on_user_id", using: :btree
  end

  create_table "goals", force: :cascade do |t|
    t.integer  "family_id"
    t.integer  "created_by_user_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["family_id"], name: "index_goals_on_family_id", using: :btree
  end

  create_table "houses", force: :cascade do |t|
    t.integer  "goal_id"
    t.integer  "total_cost"
    t.decimal  "down_payment_percent"
    t.date     "date"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["goal_id"], name: "index_houses_on_goal_id", using: :btree
  end

  create_table "invites", force: :cascade do |t|
    t.string   "email"
    t.string   "token"
    t.integer  "family_id"
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "first_name"
    t.index ["family_id"], name: "index_invites_on_family_id", using: :btree
  end

  create_table "retirements", force: :cascade do |t|
    t.integer  "goal_id"
    t.date     "date"
    t.integer  "monthly_expenses"
    t.integer  "target_amount"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["goal_id"], name: "index_retirements_on_goal_id", using: :btree
  end

  create_table "to_dos", force: :cascade do |t|
    t.integer  "goal_id"
    t.string   "item"
    t.integer  "assignee"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "user_id"
    t.boolean  "completed",  default: false
    t.index ["goal_id"], name: "index_to_dos_on_goal_id", using: :btree
    t.index ["user_id"], name: "index_to_dos_on_user_id", using: :btree
  end

  create_table "topics", force: :cascade do |t|
    t.string   "title"
    t.string   "message"
    t.text     "body"
    t.date     "due_date"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_topics_on_user_id", using: :btree
  end

  create_table "trips", force: :cascade do |t|
    t.integer  "goal_id"
    t.string   "place"
    t.integer  "duration"
    t.date     "date"
    t.integer  "flight_cost"
    t.integer  "hotel_cost"
    t.integer  "fun_cost"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "image"
    t.index ["goal_id"], name: "index_trips_on_goal_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "family_id"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["family_id"], name: "index_users_on_family_id", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "votes", force: :cascade do |t|
    t.string   "voting_for"
    t.boolean  "want_this",  default: false
    t.text     "comment"
    t.integer  "user_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["user_id"], name: "index_votes_on_user_id", using: :btree
  end

  add_foreign_key "colleges", "goals"
  add_foreign_key "comments", "goals"
  add_foreign_key "comments", "topics"
  add_foreign_key "comments", "users"
  add_foreign_key "custom_goals", "goals"
  add_foreign_key "emergency_funds", "goals"
  add_foreign_key "feedbacks", "goals"
  add_foreign_key "feedbacks", "users"
  add_foreign_key "goals", "families"
  add_foreign_key "houses", "goals"
  add_foreign_key "invites", "families"
  add_foreign_key "retirements", "goals"
  add_foreign_key "to_dos", "goals"
  add_foreign_key "to_dos", "users"
  add_foreign_key "topics", "users"
  add_foreign_key "trips", "goals"
  add_foreign_key "users", "families"
  add_foreign_key "votes", "users"
end
