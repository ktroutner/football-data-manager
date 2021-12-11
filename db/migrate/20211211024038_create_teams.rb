# frozen_string_literal: true

# Create teams table
class CreateTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :teams do |t|
      t.references :club, foreign_key: true, null: false
      t.references :main_league, foreign_key: { to_table: :competitions }
      t.integer :start_year
      t.integer :end_year

      t.timestamps
    end
  end
end
