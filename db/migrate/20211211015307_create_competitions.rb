# frozen_string_literal: true

# Create competitions table
class CreateCompetitions < ActiveRecord::Migration[6.1]
  def change
    create_table :competitions do |t|
      t.references :series, foreign_key: { to_table: :competition_series }, null: false
      t.string :name, null: false
      t.string :name_en, null: false
      t.string :name_short, null: false
      t.string :name_short_en, null: false
      t.integer :start_year, null: false
      t.integer :end_year

      t.timestamps
    end
  end
end
