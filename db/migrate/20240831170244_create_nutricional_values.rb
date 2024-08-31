class CreateNutricionalValues < ActiveRecord::Migration[6.1]
  def change
    create_table :nutricional_values do |t|
      t.float :protein
      t.float :total_carbohydrate
      t.float :lipids
      t.float :dietary_fiber
      t.float :energy_kcal
      t.float :vitamin_a
      t.float :vitamin_c
      t.float :thiamine
      t.float :niacin
      t.float :vitamin_b6
      t.float :phosphorus
      t.float :iron
      t.float :sodium
      t.float :potassium
      t.float :calcium
      t.float :magnesium
      t.float :manganese
      t.float :copper
      t.float :zinc
      t.references :food, null: false, foreign_key: true

      t.timestamps
    end
  end
end
