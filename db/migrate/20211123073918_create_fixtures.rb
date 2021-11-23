class CreateFixtures < ActiveRecord::Migration[6.1]
  def change
    create_table :fixtures do |t|
      t.references :season
      t.string :name

      t.timestamps
    end
  end
end
