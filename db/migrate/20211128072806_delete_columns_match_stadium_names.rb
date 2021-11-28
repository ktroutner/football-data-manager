# frozen_string_literal: true

# Delete stadium name columns from matches since stadiums have been moved to separate table
class DeleteColumnsMatchStadiumNames < ActiveRecord::Migration[6.1]
  def change
    remove_column :matches, :stadium, :string, null: false, default: ''
    remove_column :matches, :stadium_en, :string, null: false, default: ''
    remove_column :matches, :stadium_short, :string, null: false, default: ''
    remove_column :matches, :stadium_short_en, :string, null: false, default: ''
  end
end
