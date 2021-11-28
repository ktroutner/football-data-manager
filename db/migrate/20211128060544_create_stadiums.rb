# frozen_string_literal: true

# Create stadiums table and add reference from matches table
class CreateStadiums < ActiveRecord::Migration[6.1]
  def change
    create_table :stadiums do |t|
      t.string :name, null: false
      t.string :name_en, null: false
      t.string :name_short, null: false
      t.string :name_short_en, null: false
      t.integer :prefecture, null: false

      t.timestamps
    end

    add_reference :matches, :stadium, foreign_key: true, after: :stadium_short_en
  end
end
