class AddIngredientToSteps < ActiveRecord::Migration[5.1]
  def change
    add_reference :steps, :ingredient, foreign_key: true
  end
end
