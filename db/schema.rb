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

ActiveRecord::Schema.define(version: 20150212003756) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "favorites", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.uuid     "image_id",   null: false
    t.uuid     "user_id",    null: false
  end

  add_index "favorites", ["image_id", "user_id"], name: "index_favorites_on_image_id_and_user_id", unique: true, using: :btree

  create_table "images", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.datetime "created_at",                      null: false
    t.string   "name",                            null: false
    t.string   "original_source",                 null: false
    t.string   "state",           default: "new"
    t.integer  "bytes",                           null: false
    t.string   "shortcode",                       null: false
  end

  add_index "images", ["shortcode"], name: "index_images_on_shortcode", unique: true, using: :btree

  create_table "passes", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.uuid     "image_id",   null: false
    t.uuid     "user_id",    null: false
  end

  add_index "passes", ["image_id", "user_id"], name: "index_passes_on_image_id_and_user_id", unique: true, using: :btree

  create_table "users", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "authentication_token",             null: false
    t.string   "email"
    t.integer  "sign_in_count",        default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["authentication_token"], name: "index_users_on_authentication_token", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  add_foreign_key "favorites", "images"
  add_foreign_key "favorites", "users"
  add_foreign_key "passes", "images"
  add_foreign_key "passes", "users"
end
