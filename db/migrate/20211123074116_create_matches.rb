class CreateMatches < ActiveRecord::Migration[6.1]
  def change
    create_table :matches do |t|
      t.references :home_team, foreign_key: { to_table: :team }
      t.references :away_team, foreign_key: { to_table: :team }
      t.string :location
      t.timestamp :kickoff_at
      t.integer :home_score
      t.integer :away_score

      t.timestamps
    end
  end
end
