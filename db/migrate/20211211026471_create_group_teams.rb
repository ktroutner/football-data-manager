# frozen_string_literal: true

# Create group_teams table
class CreateGroupTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :group_teams do |t|
      t.references :group, foreign_key: true, null: false
      t.references :team, foreign_key: { to_table: :competition_teams }, null: false

      t.timestamps
    end
  end
end
