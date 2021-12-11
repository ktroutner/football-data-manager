# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_12_11_021711) do

  create_table "competition_series", force: :cascade do |t|
    t.string "name", null: false
    t.string "name_en", null: false
    t.string "name_short", null: false
    t.string "name_short_en", null: false
    t.boolean "international", default: false, null: false
    t.integer "region"
    t.integer "country"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "competition_stages", force: :cascade do |t|
    t.integer "competition_id", null: false
    t.string "name", null: false
    t.string "name_en", null: false
    t.string "type", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["competition_id"], name: "index_competition_stages_on_competition_id"
  end

  create_table "competitions", force: :cascade do |t|
    t.integer "series_id", null: false
    t.integer "start_year", null: false
    t.integer "end_year", null: false
    t.string "type", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["series_id"], name: "index_competitions_on_series_id"
  end

  create_table "fixtures", force: :cascade do |t|
    t.integer "competition_id", null: false
    t.integer "stage_id"
    t.integer "order", null: false
    t.string "name"
    t.string "name_en"
    t.string "name_short"
    t.string "name_short_en"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["competition_id", "stage_id", "order"], name: "index_fixtures_on_competition_id_and_stage_id_and_order", unique: true
    t.index ["competition_id"], name: "index_fixtures_on_competition_id"
    t.index ["stage_id"], name: "index_fixtures_on_stage_id"
  end

  create_table "groups", force: :cascade do |t|
    t.integer "stage_id", null: false
    t.string "name"
    t.string "name_en"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["stage_id"], name: "index_groups_on_stage_id"
  end

  add_foreign_key "competition_stages", "competitions"
  add_foreign_key "competitions", "competition_series", column: "series_id"
  add_foreign_key "fixtures", "competition_stages", column: "stage_id"
  add_foreign_key "fixtures", "competitions"
  add_foreign_key "groups", "competition_stages", column: "stage_id"
end
