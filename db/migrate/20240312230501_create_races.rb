class CreateRaces < ActiveRecord::Migration[7.1]
  def change
    create_table :races, id: false do |t|
      t.bigint :id, primary_key: true, null: false
      t.string :name
      t.string :description
      t.string :faction
      t.string :media_url

      t.timestamps
    end
  end
end
