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

ActiveRecord::Schema.define(version: 2024_08_31_170244) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "foods", force: :cascade do |t|
    t.string "name"
    t.string "table"
    t.string "scientific_name"
    t.string "code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "nutricional_values", force: :cascade do |t|
    t.float "protein"
    t.float "total_carbohydrate"
    t.float "lipids"
    t.float "dietary_fiber"
    t.float "energy_kcal"
    t.float "vitamin_a"
    t.float "vitamin_c"
    t.float "thiamine"
    t.float "niacin"
    t.float "vitamin_b6"
    t.float "phosphorus"
    t.float "iron"
    t.float "sodium"
    t.float "potassium"
    t.float "calcium"
    t.float "magnesium"
    t.float "manganese"
    t.float "copper"
    t.float "zinc"
    t.bigint "food_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["food_id"], name: "index_nutricional_values_on_food_id"
  end

  add_foreign_key "nutricional_values", "foods"
end
