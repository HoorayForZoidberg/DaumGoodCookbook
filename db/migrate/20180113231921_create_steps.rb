class CreateSteps < ActiveRecord::Migration[5.1]
  def change
    create_table :steps do |t|
      t.string :step_number
      t.string :measure_amount
      t.string :instructions

      t.timestamps
    end
  end
end
