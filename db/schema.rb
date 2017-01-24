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

ActiveRecord::Schema.define(version: 20170124162530) do

  create_table "activities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "strava_id"
    t.string   "name"
    t.decimal  "start_lat",                          precision: 10, scale: 6
    t.decimal  "start_lng",                          precision: 10, scale: 6
    t.decimal  "end_lat",                            precision: 10, scale: 6
    t.decimal  "end_lng",                            precision: 10, scale: 6
    t.float    "total_elevation_gain", limit: 24
    t.integer  "moving_time"
    t.float    "distance",             limit: 24
    t.datetime "created_at",                                                  null: false
    t.datetime "updated_at",                                                  null: false
    t.text     "polyline",             limit: 65535
    t.text     "summary_polyline",     limit: 65535
  end

end
