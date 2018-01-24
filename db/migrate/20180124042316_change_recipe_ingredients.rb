class ChangeRecipeIngredients < ActiveRecord::Migration[5.1]
  def change
    change_table :recipe_ingredients do |t|
      t.remove :recipe_id, :ingredient_id, :measure_id

      t.belongs_to :recipe, index: true
      t.belongs_to :ingredient, index: true
      t.belongs_to :measure, index: true
    end
  end
end
