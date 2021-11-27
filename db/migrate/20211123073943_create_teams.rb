# frozen_string_literal: true

class CreateTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :teams do |t|
      t.string :name, null: false
      t.string :name_en, null: false
      t.string :name_short, null: false
      t.string :name_short_en, null: false
      t.integer :prefecture, null: false
      t.string :hometown
      t.string :hometown_en
      t.references :main_league, foreign_key: { to_table: :competitions }

      t.timestamps
    end
  end
end
