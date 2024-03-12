class CreateSpecializations < ActiveRecord::Migration[7.1]
  def change
    create_table :specializations, id: false do |t|
      t.integer :id, primary_key: true, null: false
      t.string :name
      t.string :role
      t.string :description
      t.references :player_class, null: false, foreign_key: true

      t.timestamps
    end
  end
end
