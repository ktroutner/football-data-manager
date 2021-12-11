# frozen_string_literal: true

# Create matches table
class CreateMatches < ActiveRecord::Migration[6.1]
  def change
    create_table :matches do |t|
      t.references :fixture, foreign_key: true, null: false
      t.references :home_team, foreign_key: { to_table: :teams }
      t.references :away_team, foreign_key: { to_table: :teams }
      t.references :venue, foreign_key: true
      t.timestamp :kickoff_at
      t.integer :status
      t.integer :home_score
      t.integer :away_score
      t.references :winner_next_match, foreign_key: { to_table: :matches }
      t.references :loser_next_match, foreign_key: { to_table: :matches }

      t.timestamps
    end
  end
end
