class CreateRecipeIngredients < ActiveRecord::Migration[5.1]
  def change
    create_table :recipe_ingredients do |t|
      t.bigint :recipe_id
      t.bigint :ingredient_id
      t.bigint :measure_id
      t.string :measure_amount
      t.timestamps
    end
  end
end
