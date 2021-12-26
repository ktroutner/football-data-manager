# frozen_string_literal: true

# Create club_colors table
class CreateClubColors < ActiveRecord::Migration[6.1]
  def change
    create_table :club_colors do |t|
      t.references :club, foreign_key: true, null: false
      t.string :name
      t.string :name_en
      t.string :code, null: false
      t.integer :category, null: false

      t.timestamps
    end
  end
end
