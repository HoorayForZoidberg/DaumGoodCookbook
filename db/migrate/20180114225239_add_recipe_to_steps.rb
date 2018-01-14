class AddRecipeToSteps < ActiveRecord::Migration[5.1]
  def change
    add_reference :steps, :recipe, foreign_key: true
  end
end
