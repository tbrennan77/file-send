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

ActiveRecord::Schema.define(:version => 20130214192947) do

  create_table "bw_attachments", :force => true do |t|
    t.integer  "bw_file_id"
    t.string   "permalink"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
    t.string   "binary_file_file_name"
    t.string   "binary_file_content_type"
    t.integer  "binary_file_file_size"
    t.datetime "binary_file_updated_at"
  end

  create_table "bw_files", :force => true do |t|
    t.integer  "user_id"
    t.string   "permalink"
    t.string   "receiver_email"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
    t.string   "binary_file_file_name"
    t.string   "binary_file_content_type"
    t.integer  "binary_file_file_size"
    t.datetime "binary_file_updated_at"
    t.text     "name"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.boolean  "admin"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

end
