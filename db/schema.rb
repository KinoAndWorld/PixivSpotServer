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

ActiveRecord::Schema.define(version: 20160617204616) do

  create_table "Artwork", force: :cascade do |t|
    t.string  "title",         limit: 500
    t.string  "author",        limit: 500
    t.string  "author_avatar", limit: 500
    t.string  "image_url",     limit: 500
    t.integer "feature_id",    limit: 4,   null: false
    t.string  "identify",      limit: 500
  end

  add_index "artwork", ["feature_id"], name: "artwork_bf_fk", using: :btree

  create_table "Feature", force: :cascade do |t|
    t.string   "title",       limit: 500,   default: "", null: false
    t.string   "post_date",   limit: 500
    t.string   "summary",     limit: 500
    t.string   "cover_image", limit: 500,   default: "", null: false
    t.string   "category",    limit: 50
    t.datetime "create_time"
    t.text     "identify",    limit: 65535
  end

  create_table "artworks", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "features", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "Artwork", "Feature", column: "feature_id", name: "artwork_bf_fk"
end
