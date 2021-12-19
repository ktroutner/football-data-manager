# frozen_string_literal: true

# Create clubs table
class CreateClubs < ActiveRecord::Migration[6.1]
  def change
    create_table :clubs do |t|
      t.string :name, null: false
      t.string :name_en, null: false
      t.string :name_short, null: false
      t.string :name_short_en, null: false
      t.integer :country, null: false
      t.integer :prefecture, null: false
      t.string :hometown
      t.string :hometown_en
      t.string :logo_file_path

      t.timestamps
    end
  end
end
