class RecipeIngredient < ApplicationRecord
  belongs_to :recipes
  belongs_to :ingredients
  belongs_to :measures
end
