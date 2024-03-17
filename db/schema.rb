# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_03_12_231708) do
  create_table "heros", force: :cascade do |t|
    t.string "name"
    t.string "quote"
    t.integer "race_id", null: false
    t.integer "player_class_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_class_id"], name: "index_heros_on_player_class_id"
    t.index ["race_id"], name: "index_heros_on_race_id"
  end

  create_table "player_classes", force: :cascade do |t|
    t.string "name"
    t.string "power_type"
    t.string "media_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "race_classes", force: :cascade do |t|
    t.integer "race_id", null: false
    t.integer "player_class_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_class_id"], name: "index_race_classes_on_player_class_id"
    t.index ["race_id"], name: "index_race_classes_on_race_id"
  end

  create_table "races", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "faction"
    t.string "media_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "specializations", force: :cascade do |t|
    t.string "name"
    t.string "role"
    t.string "description"
    t.integer "player_class_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_class_id"], name: "index_specializations_on_player_class_id"
  end

  add_foreign_key "heros", "player_classes"
  add_foreign_key "heros", "races"
  add_foreign_key "race_classes", "player_classes"
  add_foreign_key "race_classes", "races"
  add_foreign_key "specializations", "player_classes"
end
