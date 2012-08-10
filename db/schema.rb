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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120810233418) do

  create_table "login_sessions", :force => true do |t|
    t.string   "email"
    t.string   "hashed_code"
    t.string   "requesting_ip"
    t.string   "requesting_user_agent"
    t.string   "activating_ip"
    t.string   "activating_user_agent"
    t.boolean  "activated",             :default => false
    t.datetime "activated_at"
    t.boolean  "terminated",            :default => false
    t.datetime "terminated_at"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
    t.string   "requesting_geo"
    t.string   "activating_geo"
  end

end
