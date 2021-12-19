# frozen_string_literal: true

# Create league_groups table
class CreateLeagueGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :league_groups do |t|
      t.references :league, foreign_key: { to_table: :competition_stages }, null: false
      t.string :name
      t.string :name_en

      t.timestamps
    end
  end
end
