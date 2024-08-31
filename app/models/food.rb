class Food < ApplicationRecord
    has_one :nutricional_value, dependent: :destroy
    accepts_nested_attributes_for :nutricional_value
  
    # validates :name, presence: true
    # validates :table, presence: true
    # validates :scientific_name, presence: true
    # validates :code, presence: true, uniqueness: true
  end


#   class Food < ApplicationRecord
#     has_one :nutritional_value, dependent: :destroy
#     accepts_nested_attributes_for :nutritional_values
# end