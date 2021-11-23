class CreateTeamColors < ActiveRecord::Migration[6.1]
  def change
    create_table :team_colors do |t|
      t.references :team
      t.string :name
      t.string :code

      t.timestamps
    end
  end
end
