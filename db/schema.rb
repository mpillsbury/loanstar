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

ActiveRecord::Schema.define(:version => 20130430033451) do

  create_table "borrows", :force => true do |t|
    t.date     "request_date"
    t.integer  "item_id"
    t.integer  "user_id"
    t.string   "status"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", :force => true do |t|
    t.string   "title"
    t.integer  "year"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "format"
    t.integer  "user_id"
    t.integer  "picture_id"
  end

  create_table "pictures", :force => true do |t|
    t.binary   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "item_id"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password"
    t.string   "display_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
