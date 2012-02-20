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

ActiveRecord::Schema.define(:version => 20120220081827) do

  create_table "applications", :force => true do |t|
    t.integer  "position_id"
    t.integer  "resume_id"
    t.integer  "applicationType"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.string   "industry"
    t.text     "description"
    t.integer  "employees"
    t.integer  "recruiter_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "companies", ["recruiter_id"], :name => "index_companies_on_recruiter_id"

  create_table "employments", :force => true do |t|
    t.integer  "company_id"
    t.integer  "recruiter_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", :force => true do |t|
    t.integer  "section_id"
    t.string   "positiontitle"
    t.string   "organization"
    t.string   "location"
    t.string   "startMonth"
    t.string   "startSeason"
    t.integer  "startYear"
    t.string   "endMonth"
    t.string   "endSeason"
    t.integer  "endYear"
    t.text     "description"
    t.integer  "order"
    t.text     "link"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "present",       :default => false
  end

  add_index "items", ["section_id"], :name => "index_items_on_section_id"

  create_table "positions", :force => true do |t|
    t.string   "title"
    t.integer  "company_id"
    t.string   "category"
    t.text     "description"
    t.integer  "numPositions"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "positions", ["company_id"], :name => "index_positions_on_company_id"

  create_table "recruiters", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.text     "passwordHash"
    t.string   "passwordSalt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "resumes", :force => true do |t|
    t.integer  "user_id"
    t.boolean  "default"
    t.string   "email"
    t.text     "html"
    t.string   "firstName"
    t.string   "lastName"
    t.string   "middleNames"
    t.string   "resumeName"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "street"
    t.string   "phone"
    t.string   "website"
  end

  add_index "resumes", ["user_id"], :name => "index_resumes_on_user_id"

  create_table "sections", :force => true do |t|
    t.integer  "resume_id"
    t.string   "name"
    t.integer  "order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sections", ["resume_id"], :name => "index_sections_on_resume_id"

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.text     "passwordHash"
    t.string   "passwordSalt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
