class CreateFixtures < ActiveRecord::Migration[6.1]
  def change
    create_table :fixtures do |t|
      t.references :season
      t.integer :number

      t.timestamps
    end
  end

  add_index :fixtures, [:season_id, :number], unique: true
end
