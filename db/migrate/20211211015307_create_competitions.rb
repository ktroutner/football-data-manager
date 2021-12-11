# frozen_string_literal: true

# Create competitions table
class CreateCompetitions < ActiveRecord::Migration[6.1]
  def change
    create_table :competitions do |t|
      t.references :series, foreign_key: { to_table: :competition_series }, null: false
      t.integer :start_year, null: false
      t.integer :end_year, null: false
      t.string :type, null: false

      t.timestamps
    end
  end
end
