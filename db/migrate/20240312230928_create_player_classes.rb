class CreatePlayerClasses < ActiveRecord::Migration[7.1]
  def change
    create_table :player_classes, id: false do |t|
      t.integer :id, primary_key: true, null: false
      t.string :name
      t.string :power_type
      t.string :media_url

      t.timestamps
    end
  end
end
