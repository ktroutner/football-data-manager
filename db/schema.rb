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

ActiveRecord::Schema.define(version: 2021_12_11_032254) do

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
    t.integer "country", null: false
    t.integer "prefecture", null: false
    t.string "hometown"
    t.string "hometown_en"
    t.string "logo_file_path"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "competition_series", force: :cascade do |t|
    t.string "name", null: false
    t.string "name_en", null: false
    t.string "name_short", null: false
    t.string "name_short_en", null: false
    t.integer "region"
    t.integer "country"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "competition_stages", force: :cascade do |t|
    t.integer "competition_id", null: false
    t.string "type", null: false
    t.integer "order", null: false
    t.string "name"
    t.string "name_en"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["competition_id", "order"], name: "index_competition_stages_on_competition_id_and_order", unique: true
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
    t.string "name", null: false
    t.string "name_en", null: false
    t.string "name_short", null: false
    t.string "name_short_en", null: false
    t.integer "start_year", null: false
    t.integer "end_year"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["series_id"], name: "index_competitions_on_series_id"
  end

  create_table "fixtures", force: :cascade do |t|
    t.integer "stage_id", null: false
    t.string "type", null: false
    t.integer "order", null: false
    t.string "name"
    t.string "name_en"
    t.string "name_short"
    t.string "name_short_en"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["stage_id", "order"], name: "index_fixtures_on_stage_id_and_order", unique: true
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

  create_table "league_groups", force: :cascade do |t|
    t.integer "league_id", null: false
    t.string "name"
    t.string "name_en"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["league_id"], name: "index_league_groups_on_league_id"
  end

  create_table "matches", force: :cascade do |t|
    t.integer "fixture_id"
    t.integer "category"
    t.integer "home_team_id"
    t.integer "away_team_id"
    t.integer "venue_id"
    t.datetime "kickoff_at"
    t.integer "status"
    t.integer "home_score"
    t.integer "away_score"
    t.integer "home_pk"
    t.integer "away_pk"
    t.integer "winner_next_match_id"
    t.integer "loser_next_match_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["away_team_id"], name: "index_matches_on_away_team_id"
    t.index ["fixture_id"], name: "index_matches_on_fixture_id"
    t.index ["home_team_id"], name: "index_matches_on_home_team_id"
    t.index ["loser_next_match_id"], name: "index_matches_on_loser_next_match_id"
    t.index ["venue_id"], name: "index_matches_on_venue_id"
    t.index ["winner_next_match_id"], name: "index_matches_on_winner_next_match_id"
  end

  create_table "teams", force: :cascade do |t|
    t.integer "club_id", null: false
    t.integer "start_year", null: false
    t.integer "end_year"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["club_id"], name: "index_teams_on_club_id"
  end

  create_table "venues", force: :cascade do |t|
    t.string "name", null: false
    t.string "name_en", null: false
    t.string "name_short", null: false
    t.string "name_short_en", null: false
    t.integer "country", null: false
    t.integer "prefecture", null: false
    t.string "city", null: false
    t.string "city_en", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "club_colors", "clubs"
  add_foreign_key "competition_stages", "competitions"
  add_foreign_key "competition_teams", "competitions"
  add_foreign_key "competition_teams", "teams"
  add_foreign_key "competitions", "competition_series", column: "series_id"
  add_foreign_key "fixtures", "competition_stages", column: "stage_id"
  add_foreign_key "group_teams", "competition_teams", column: "team_id"
  add_foreign_key "group_teams", "league_groups", column: "group_id"
  add_foreign_key "league_groups", "competition_stages", column: "league_id"
  add_foreign_key "matches", "fixtures"
  add_foreign_key "matches", "matches", column: "loser_next_match_id"
  add_foreign_key "matches", "matches", column: "winner_next_match_id"
  add_foreign_key "matches", "teams", column: "away_team_id"
  add_foreign_key "matches", "teams", column: "home_team_id"
  add_foreign_key "matches", "venues"
  add_foreign_key "teams", "clubs"
end
