class CreateTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :location
      t.references :season_member

      t.timestamps
    end
  end
end
