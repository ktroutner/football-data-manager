# frozen_string_literal: true

# Create team_colors table
class CreateTeamColors < ActiveRecord::Migration[6.1]
  def change
    create_table :team_colors do |t|
      t.references :team
      t.string :name
      t.string :name_en
      t.string :code, null: false

      t.timestamps
    end
  end
end
