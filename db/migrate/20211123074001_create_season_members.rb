# frozen_string_literal: true

# Create season_members intermediate table
class CreateSeasonMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :season_members do |t|
      t.references :season
      t.references :team

      t.timestamps
    end
  end
end
