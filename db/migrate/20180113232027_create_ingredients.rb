class CreateIngredients < ActiveRecord::Migration[5.1]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.text :description, null: true

      t.timestamps
    end
  end
end
