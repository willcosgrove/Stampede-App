# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100315221617) do

  create_table "stampeders", :force => true do |t|
    t.string   "lastname"
    t.string   "firstname"
    t.integer  "barcode"
    t.string   "studentphone"
    t.string   "address"
    t.integer  "grade"
    t.string   "city"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "team_id"
    t.string   "subgroup"
    t.string   "gender"
    t.integer  "zipcode"
    t.string   "parentphone"
    t.date     "dob"
    t.string   "parent"
    t.string   "school"
    t.boolean  "text"
    t.string   "email"
    t.integer  "friend_id"
  end

  add_index "stampeders", ["friend_id"], :name => "index_stampeders_on_friend_id"
  add_index "stampeders", ["team_id"], :name => "index_stampeders_on_team_id"

  create_table "teams", :force => true do |t|
    t.string   "name"
    t.integer  "previous_points"
    t.integer  "indoor_games_points"
    t.integer  "outdoor_games_points"
    t.integer  "friend_points"
    t.integer  "spirit_points"
    t.integer  "deductions"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
