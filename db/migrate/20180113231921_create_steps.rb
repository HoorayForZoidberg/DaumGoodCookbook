class CreateSteps < ActiveRecord::Migration[5.1]
  def change
    create_table :steps do |t|
      t.integer :step_number
      t.text :instructions
      t.references :recipe, foreign_key: true

      t.timestamps
    end
  end
end
