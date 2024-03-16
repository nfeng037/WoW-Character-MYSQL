class CreatePlayerClasses < ActiveRecord::Migration[7.1]
  def change
    create_table :player_classes do |t|
      t.string :name
      t.string :power_type
      t.string :media_url

      t.timestamps
    end
  end
end
