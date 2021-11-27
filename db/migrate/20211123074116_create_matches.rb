# frozen_string_literal: true

# Create matches table
class CreateMatches < ActiveRecord::Migration[6.1]
  def change
    create_table :matches do |t|
      t.references :fixture
      t.references :home_team, foreign_key: { to_table: :teams }
      t.references :away_team, foreign_key: { to_table: :teams }
      t.string :stadium, null: false
      t.string :stadium_en, null: false
      t.string :stadium_short, null: false
      t.string :stadium_short_en, null: false
      t.timestamp :kickoff_at
      t.integer :home_score
      t.integer :away_score

      t.timestamps
    end
  end
end
