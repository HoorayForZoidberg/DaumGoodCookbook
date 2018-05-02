class Recipe < ApplicationRecord
  belongs_to :user
  has_many :steps, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients, extend: IngredientMeasure

  def owner
    return User.find(self.owner_id).name
  end
end
