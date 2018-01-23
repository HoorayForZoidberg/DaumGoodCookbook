class AddDescriptionToIngredients < ActiveRecord::Migration[5.1]
  def change
    add_column :ingredients, :description, :text
  end
end
