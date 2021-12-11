# frozen_string_literal: true

# Create competition_series table
class CreateCompetitionSeries < ActiveRecord::Migration[6.1]
  def change
    create_table :competition_series do |t|
      t.string :name, null: false
      t.string :name_en, null: false
      t.string :name_short, null: false
      t.string :name_short_en, null: false
      t.boolean :international, null: false, default: false
      t.integer :region
      t.integer :country

      t.timestamps
    end
  end
end
