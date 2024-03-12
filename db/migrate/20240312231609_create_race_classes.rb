class CreateRaceClasses < ActiveRecord::Migration[7.1]
  def change
    create_table :race_classes do |t|
      t.references :race, null: false, foreign_key: true
      t.references :player_class, null: false, foreign_key: true

      t.timestamps
    end
  end
end
