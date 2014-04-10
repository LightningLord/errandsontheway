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

ActiveRecord::Schema.define(version: 20140410220417) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "routes", force: true do |t|
    t.string   "url"
    t.integer  "ending_duration",       default: 0
    t.integer  "original_duration",     default: 0
    t.float    "start_point_latitude"
    t.float    "start_point_longitude"
    t.float    "end_point_latitude"
    t.float    "end_point_longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
