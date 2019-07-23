class AddCookToRecipes < ActiveRecord::Migration[5.1]
  def change
    add_column :recipes, :cook, :string
  end
end
