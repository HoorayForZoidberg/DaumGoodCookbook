class CreateSteps < ActiveRecord::Migration[5.1]
  def change
    create_table :steps do |t|
      t.integer :step_number
      t.string :instructions

      t.timestamps
    end
  end
end
