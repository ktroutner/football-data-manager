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
    t.string "name"
    t.string "region"
    t.string "country"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "fixtures", force: :cascade do |t|
    t.integer "season_id"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["season_id"], name: "index_fixtures_on_season_id"
  end

  create_table "matches", force: :cascade do |t|
    t.integer "home_team_id"
    t.integer "away_team_id"
    t.string "location"
    t.datetime "kickoff_at"
    t.integer "home_score"
    t.integer "away_score"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["away_team_id"], name: "index_matches_on_away_team_id"
    t.index ["home_team_id"], name: "index_matches_on_home_team_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.string "name_kana"
    t.integer "team_id"
    t.string "country"
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
    t.integer "year"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["competition_id"], name: "index_seasons_on_competition_id"
  end

  create_table "team_colors", force: :cascade do |t|
    t.integer "team_id"
    t.string "name"
    t.string "code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["team_id"], name: "index_team_colors_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.integer "season_member_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["season_member_id"], name: "index_teams_on_season_member_id"
  end

  add_foreign_key "matches", "team", column: "away_team_id"
  add_foreign_key "matches", "team", column: "home_team_id"
end
