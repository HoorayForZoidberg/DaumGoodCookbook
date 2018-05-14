class RemoveCategoryFromRecipes < ActiveRecord::Migration[5.1]
  def change
    remove_column :recipes, :category
  end
end
