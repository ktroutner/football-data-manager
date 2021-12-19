# frozen_string_literal: true

# Creat competition_stages table
class CreateCompetitionStages < ActiveRecord::Migration[6.1]
  def change
    create_table :competition_stages do |t|
      t.references :competition, foreign_key: true, null: false
      t.string :type, null: false
      t.integer :order, null: false
      t.string :name
      t.string :name_en

      t.timestamps
    end

    add_index :competition_stages, %i[competition_id order], unique: true
  end
end
