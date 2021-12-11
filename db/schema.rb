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

ActiveRecord::Schema.define(version: 2021_12_11_026471) do

  create_table "club_colors", force: :cascade do |t|
    t.integer "club_id", null: false
    t.string "name"
    t.string "name_en"
    t.string "code", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["club_id"], name: "index_club_colors_on_club_id"
  end

  create_table "clubs", force: :cascade do |t|
    t.string "name", null: false
    t.string "name_en", null: false
    t.string "name_short", null: false
    t.string "name_short_en", null: false
    t.string "hometown"
    t.string "hometown_en"
    t.integer "country"
    t.integer "prefecture"
    t.string "logo_file_path"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

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

  create_table "competition_teams", force: :cascade do |t|
    t.integer "competition_id", null: false
    t.integer "team_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["competition_id"], name: "index_competition_teams_on_competition_id"
    t.index ["team_id"], name: "index_competition_teams_on_team_id"
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

  create_table "group_teams", force: :cascade do |t|
    t.integer "group_id", null: false
    t.integer "team_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["group_id"], name: "index_group_teams_on_group_id"
    t.index ["team_id"], name: "index_group_teams_on_team_id"
  end

  create_table "groups", force: :cascade do |t|
    t.integer "stage_id", null: false
    t.string "name"
    t.string "name_en"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["stage_id"], name: "index_groups_on_stage_id"
  end

  create_table "teams", force: :cascade do |t|
    t.integer "club_id", null: false
    t.integer "main_league_id"
    t.integer "start_year"
    t.integer "end_year"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["club_id"], name: "index_teams_on_club_id"
    t.index ["main_league_id"], name: "index_teams_on_main_league_id"
  end

  add_foreign_key "club_colors", "clubs"
  add_foreign_key "competition_stages", "competitions"
  add_foreign_key "competition_teams", "competitions"
  add_foreign_key "competition_teams", "teams"
  add_foreign_key "competitions", "competition_series", column: "series_id"
  add_foreign_key "fixtures", "competition_stages", column: "stage_id"
  add_foreign_key "fixtures", "competitions"
  add_foreign_key "group_teams", "competition_teams", column: "team_id"
  add_foreign_key "group_teams", "groups"
  add_foreign_key "groups", "competition_stages", column: "stage_id"
  add_foreign_key "teams", "clubs"
  add_foreign_key "teams", "competitions", column: "main_league_id"
end
