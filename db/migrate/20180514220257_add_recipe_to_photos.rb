class AddRecipeToPhotos < ActiveRecord::Migration[5.1]
  def change
    add_reference :photos, :recipe, foreign_key: true
  end
end
