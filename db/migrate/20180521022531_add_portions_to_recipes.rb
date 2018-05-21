class AddPortionsToRecipes < ActiveRecord::Migration[5.1]
  def change
    add_column :recipes, :portions, :int
  end
end
