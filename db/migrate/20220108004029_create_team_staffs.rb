# frozen_string_literal: true

# Create team_staffs table
class CreateTeamStaffs < ActiveRecord::Migration[6.1]
  def change
    create_table :team_staffs do |t|
      t.references :team, foreign_key: true, null: false
      t.references :staff, foreign_key: true, null: false
      t.integer :position
      t.date :joined_on, null: false
      t.date :left_on

      t.timestamps
    end
  end
end
