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

ActiveRecord::Schema.define(version: 20151113233439) do

  create_table "events", force: :cascade do |t|
    t.string   "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "maps", force: :cascade do |t|
    t.float    "latitude"
    t.float    "longitude"
    t.string   "address"
    t.string   "title"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "recommendation_id"
  end

  create_table "recommendations", force: :cascade do |t|
    t.string   "event_1_check_box"
    t.string   "event_1_name"
    t.string   "event_1_location"
    t.string   "event_1_address"
    t.string   "event_1_url"
    t.text     "event_1_desc"
    t.string   "event_2_check_box"
    t.string   "event_2_name"
    t.string   "event_2_location"
    t.string   "event_2_address"
    t.string   "event_2_url"
    t.text     "event_2_desc"
    t.string   "event_3_check_box"
    t.string   "event_3_name"
    t.string   "event_3_location"
    t.string   "event_3_address"
    t.string   "event_3_url"
    t.text     "event_3_desc"
    t.string   "event_4_check_box"
    t.string   "event_4_name"
    t.string   "event_4_location"
    t.string   "event_4_address"
    t.string   "event_4_url"
    t.text     "event_4_desc"
    t.string   "event_5_check_box"
    t.string   "event_5_name"
    t.string   "event_5_location"
    t.string   "event_5_address"
    t.string   "event_5_url"
    t.text     "event_5_desc"
    t.string   "event_6_check_box"
    t.string   "event_6_name"
    t.string   "event_6_location"
    t.string   "event_6_address"
    t.string   "event_6_url"
    t.text     "event_6_desc"
    t.string   "event_7_check_box"
    t.string   "event_7_name"
    t.string   "event_7_location"
    t.string   "event_7_address"
    t.string   "event_7_url"
    t.text     "event_7_desc"
    t.string   "event_8_check_box"
    t.string   "event_8_name"
    t.string   "event_8_location"
    t.string   "event_8_address"
    t.string   "event_8_url"
    t.text     "event_8_desc"
    t.string   "event_9_check_box"
    t.string   "event_9_name"
    t.string   "event_9_location"
    t.string   "event_9_address"
    t.string   "event_9_url"
    t.text     "event_9_desc"
    t.string   "event_10_check_box"
    t.string   "event_10_name"
    t.string   "event_10_location"
    t.string   "event_10_address"
    t.string   "event_10_url"
    t.text     "event_10_desc"
    t.string   "dine_1_name"
    t.string   "dine_1_check_box"
    t.integer  "dine_1_price"
    t.string   "dine_1_address"
    t.string   "dine_1_url"
    t.string   "dine_2_check_box"
    t.string   "dine_2_name"
    t.integer  "dine_2_price"
    t.string   "dine_2_address"
    t.string   "dine_2_url"
    t.string   "dine_3_check_box"
    t.string   "dine_3_name"
    t.integer  "dine_3_price"
    t.string   "dine_3_address"
    t.string   "dine_3_url"
    t.string   "dine_4_check_box"
    t.string   "dine_4_name"
    t.integer  "dine_4_price"
    t.string   "dine_4_address"
    t.string   "dine_4_url"
    t.string   "dine_5_check_box"
    t.string   "dine_5_name"
    t.integer  "dine_5_price"
    t.string   "dine_5_address"
    t.string   "dine_5_url"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

end
