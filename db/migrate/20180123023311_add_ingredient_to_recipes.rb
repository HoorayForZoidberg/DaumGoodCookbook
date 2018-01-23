class AddIngredientToRecipes < ActiveRecord::Migration[5.1]
  def change
    add_reference :recipes, :ingredient, index: true
  end
end
