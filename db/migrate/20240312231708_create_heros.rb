class CreateHeros < ActiveRecord::Migration[7.1]
  def change
    create_table :heros do |t|
      t.string :name
      t.string :quote
      t.references :race, null: false, foreign_key: true
      t.references :player_class, null: false, foreign_key: true

      t.timestamps
    end
  end
end
