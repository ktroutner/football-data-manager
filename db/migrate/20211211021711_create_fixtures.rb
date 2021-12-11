# frozen_string_literal: true

# Create fixtures table
class CreateFixtures < ActiveRecord::Migration[6.1]
  def change
    create_table :fixtures do |t|
      t.references :competition, foreign_key: true, null: false
      t.references :stage, foreign_key: { to_table: :competition_stages }
      t.integer :order, null: false
      t.string :name
      t.string :name_en
      t.string :name_short
      t.string :name_short_en

      t.timestamps
    end

    add_index :fixtures, %i[competition_id stage_id order], unique: true
  end
end
