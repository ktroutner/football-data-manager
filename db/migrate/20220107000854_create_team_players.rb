# frozen_string_literal: true

# Create team_players table
class CreateTeamPlayers < ActiveRecord::Migration[6.1]
  def change
    create_table :team_players do |t|
      t.references :team, foreign_key: true, null: false
      t.references :player, foreign_key: true, null: false
      t.integer :position, null: false
      t.integer :number, null: false
      t.date :joined_on, null: false
      t.date :left_on
      t.integer :acquisition_type, null: false, default: 1
      t.boolean :is_on_loan, null: false, default: false

      t.timestamps
    end
  end
end
