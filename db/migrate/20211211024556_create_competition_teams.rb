# frozen_string_literal: true

# Create competition_teams table
class CreateCompetitionTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :competition_teams do |t|
      t.references :competition, foreign_key: true, null: false
      t.references :team, foreign_key: true, null: false

      t.timestamps
    end
  end
end
