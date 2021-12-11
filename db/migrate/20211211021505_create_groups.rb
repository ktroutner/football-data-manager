# frozen_string_literal: true

# Create groups table
class CreateGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :groups do |t|
      t.references :stage, foreign_key: { to_table: :competition_stages }, null: false
      t.string :name
      t.string :name_en

      t.timestamps
    end
  end
end
