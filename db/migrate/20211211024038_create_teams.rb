# frozen_string_literal: true

# Create teams table
class CreateTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :teams do |t|
      t.references :club, foreign_key: true, null: false
      t.integer :start_year, null: false
      t.integer :end_year

      t.timestamps
    end
  end
end
