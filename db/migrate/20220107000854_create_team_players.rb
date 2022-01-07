# frozen_string_literal: true

# Create team_players table
class CreateTeamPlayers < ActiveRecord::Migration[6.1]
  def change
    create_table :team_players do |t|
      t.references :team, foreign_key: true, null: false
      t.references :player, foreign_key: true, null: false
      t.integer :position
      t.integer :number
      t.date :joined_on, null: false
      t.date :left_on
      t.integer :acquisition_type
      t.boolean :is_on_loan

      t.timestamps
    end
  end
end
