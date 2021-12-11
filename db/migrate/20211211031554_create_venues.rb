# frozen_string_literal: true

# Create venues table
class CreateVenues < ActiveRecord::Migration[6.1]
  def change
    create_table :venues do |t|
      t.string :name, null: false
      t.string :name_en, null: false
      t.string :name_short, null: false
      t.string :name_short_en, null: false
      t.integer :country, null: false
      t.integer :prefecture, null: false
      t.string :city, null: false
      t.string :city_en, null: false

      t.timestamps
    end
  end
end
