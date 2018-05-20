class AddTotalTimeToRecipes < ActiveRecord::Migration[5.1]
  def change
    add_column :recipes, :total_time, :bigint, default: 0
  end
end
