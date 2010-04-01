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

ActiveRecord::Schema.define(:version => 20100401232419) do

  create_table "points", :force => true do |t|
    t.integer  "team_id"
    t.date     "day"
    t.integer  "previous_points"
    t.integer  "indoor_games"
    t.integer  "outdoor_games"
    t.integer  "spirit_points"
    t.integer  "deductions"
    t.boolean  "most_friends"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "points", ["team_id"], :name => "index_points_on_team_id"

  create_table "schools", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "signins", :force => true do |t|
    t.integer  "stampeder_id"
    t.date     "day_signed_in"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "signins", ["stampeder_id"], :name => "index_signins_on_stampeder_id"

  create_table "stampeders", :force => true do |t|
    t.string   "lastname"
    t.string   "firstname"
    t.string   "barcode"
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
    t.string   "zipcode"
    t.string   "parentphone"
    t.date     "dob"
    t.string   "parent"
    t.boolean  "textmsg"
    t.string   "email"
    t.integer  "friend_id"
    t.string   "fullname"
    t.integer  "school_id"
    t.text     "notes"
  end

  add_index "stampeders", ["friend_id"], :name => "index_stampeders_on_friend_id"
  add_index "stampeders", ["school_id"], :name => "index_stampeders_on_school_id"
  add_index "stampeders", ["team_id"], :name => "index_stampeders_on_team_id"

  create_table "teams", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
