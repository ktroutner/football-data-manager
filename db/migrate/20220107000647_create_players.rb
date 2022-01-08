# frozen_string_literal: true

# Create players table
class CreatePlayers < ActiveRecord::Migration[6.1]
  def change
    create_table :players do |t|
      t.string :name, null: false
      t.string :name_en, null: false
      t.string :name_kana, null: false
      t.integer :country, null: false
      t.integer :prefecture, null: false
      t.integer :position, null: false
      t.date :date_of_birth
      t.integer :height
      t.integer :footedness
      t.integer :status

      t.timestamps
    end
  end
end
