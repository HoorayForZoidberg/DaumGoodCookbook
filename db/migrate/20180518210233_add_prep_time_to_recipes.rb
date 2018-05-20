class AddPrepTimeToRecipes < ActiveRecord::Migration[5.1]
  def change
    add_column :recipes, :prep_time, :int
    add_column :recipes, :cook_time, :int
    add_column :recipes, :rest_time, :int
  end
end
