# frozen_string_literal: true

# Create staffs table
class CreateStaffs < ActiveRecord::Migration[6.1]
  def change
    create_table :staffs do |t|
      t.string :name, null: false
      t.string :name_en, null: false
      t.string :name_kana
      t.integer :country, null: false
      t.integer :prefecture
      t.date :date_of_birth
      t.references :player, foreign_key: true

      t.timestamps
    end
  end
end
