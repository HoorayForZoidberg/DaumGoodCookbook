class AddMeasureToRecipeIngredients < ActiveRecord::Migration[5.1]
  def change
    add_reference :recipe_ingredients, :measure, index: true
    add_column :recipe_ingredients, :measure_amount, :string
  end
end
