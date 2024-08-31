# class NutricionalValue < ApplicationRecord
#   belongs_to :food, inverse_of: :nutricional_value
# end
class NutricionalValue < ApplicationRecord
  belongs_to :food

  # validates :protein, :total_carbohydrate, :lipids, :dietary_fiber, :energy_kcal,
  #           :vitamin_a, :vitamin_c, :thiamine, :niacin, :vitamin_b6,
  #           :phosphorus, :iron, :sodium, :potassium, :calcium,
  #           :magnesium, :manganese, :copper, :zinc,
  #           presence: true, numericality: { greater_than_or_equal_to: 0 }
end