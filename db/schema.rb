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

ActiveRecord::Schema.define(:version => 20120401161635) do

  create_table "lists", :force => true do |t|
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.integer  "region"
    t.float    "bathrooms"
    t.integer  "rent"
    t.integer  "squarefeet"
    t.boolean  "smoking"
    t.boolean  "heat"
    t.boolean  "electric"
    t.integer  "flags"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "gas"
    t.boolean  "garbagecollection"
    t.integer  "length"
    t.boolean  "furnished"
    t.boolean  "laundry"
    t.boolean  "parking"
    t.integer  "bedrooms"
    t.boolean  "pets"
    t.boolean  "ltype"
  end

  add_index "lists", ["address"], :name => "index_lists_on_Address"
  add_index "lists", ["bedrooms"], :name => "index_lists_on_Bedrooms"
  add_index "lists", ["rent"], :name => "index_lists_on_Rent"

  create_table "reviews", :force => true do |t|
    t.string   "review_body"
    t.float    "rating"
    t.integer  "helpfullness"
    t.integer  "flag"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "Name"
    t.string   "Email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password"
    t.string   "salt"
    t.boolean  "admin",              :default => false
  end

  add_index "users", ["Email"], :name => "index_users_on_Email", :unique => true

end
