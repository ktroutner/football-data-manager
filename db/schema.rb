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

ActiveRecord::Schema.define(version: 2021_11_23_074232) do

  create_table "competitions", force: :cascade do |t|
    t.string "name", null: false
    t.string "name_en", null: false
    t.string "name_short", null: false
    t.string "name_short_en", null: false
    t.integer "region", null: false
    t.integer "country"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "fixtures", force: :cascade do |t|
    t.integer "season_id"
    t.integer "number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["season_id"], name: "index_fixtures_on_season_id"
  end

  create_table "matches", force: :cascade do |t|
    t.integer "fixture_id"
    t.integer "home_team_id"
    t.integer "away_team_id"
    t.string "stadium", null: false
    t.string "stadium_en", null: false
    t.string "stadium_short", null: false
    t.string "stadium_short_en", null: false
    t.datetime "kickoff_at"
    t.integer "home_score"
    t.integer "away_score"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["away_team_id"], name: "index_matches_on_away_team_id"
    t.index ["fixture_id"], name: "index_matches_on_fixture_id"
    t.index ["home_team_id"], name: "index_matches_on_home_team_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "name", null: false
    t.string "name_kana", null: false
    t.string "name_en", null: false
    t.integer "team_id"
    t.integer "country"
    t.integer "position"
    t.date "birthday"
    t.integer "height"
    t.integer "footedness"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["team_id"], name: "index_players_on_team_id"
  end

  create_table "season_members", force: :cascade do |t|
    t.integer "season_id"
    t.integer "team_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["season_id"], name: "index_season_members_on_season_id"
    t.index ["team_id"], name: "index_season_members_on_team_id"
  end

  create_table "seasons", force: :cascade do |t|
    t.integer "competition_id"
    t.integer "year", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["competition_id"], name: "index_seasons_on_competition_id"
  end

  create_table "team_colors", force: :cascade do |t|
    t.integer "team_id"
    t.string "name"
    t.string "name_en"
    t.string "code", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["team_id"], name: "index_team_colors_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name", null: false
    t.string "name_en", null: false
    t.string "name_short", null: false
    t.string "name_short_en", null: false
    t.integer "prefecture", null: false
    t.string "hometown"
    t.string "hometown_en"
    t.integer "main_league_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["main_league_id"], name: "index_teams_on_main_league_id"
  end

  add_foreign_key "matches", "teams", column: "away_team_id"
  add_foreign_key "matches", "teams", column: "home_team_id"
  add_foreign_key "teams", "competitions", column: "main_league_id"
end
