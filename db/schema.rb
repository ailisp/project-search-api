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

ActiveRecord::Schema.define(version: 2019_03_16_021118) do

  create_table "projects", force: :cascade do |t|
    t.integer "Project Geographic District"
    t.string "Project Building Identifier"
    t.string "Project School Name"
    t.string "Project Type"
    t.string "Project Description"
    t.string "Project Phase Name"
    t.string "Project Status Name"
    t.date "Project Phase Actual Start Date"
    t.date "Project Phase Planned End Date"
    t.date "Project Phase Actual End Date"
    t.integer "Project Budget Amount"
    t.integer "Final Estimate of Actual Costs Through End of Phase Amount"
    t.integer "Total Phase Actual Spending Amount"
    t.string "DSF Number"
  end

end
