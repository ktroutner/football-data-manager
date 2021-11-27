# frozen_string_literal: true

# Create players table
class CreatePlayers < ActiveRecord::Migration[6.1]
  def change
    create_table :players do |t|
      t.string :name, null: false
      t.string :name_kana, null: false
      t.string :name_en, null: false
      t.references :team
      t.integer :country
      t.integer :position
      t.date :birthday
      t.integer :height
      t.integer :footedness

      t.timestamps
    end
  end
end
