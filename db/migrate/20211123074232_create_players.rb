class CreatePlayers < ActiveRecord::Migration[6.1]
  def change
    create_table :players do |t|
      t.string :name
      t.string :name_kana
      t.references :team
      t.string :country
      t.integer :position
      t.date :birthday
      t.integer :height
      t.integer :footedness

      t.timestamps
    end
  end
end
