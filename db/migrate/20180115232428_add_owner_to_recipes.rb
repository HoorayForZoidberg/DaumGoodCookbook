class AddOwnerToRecipes < ActiveRecord::Migration[5.1]
  def change
    add_reference :recipes, :owner, index: true
  end
end
