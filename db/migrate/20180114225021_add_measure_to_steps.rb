class AddMeasureToSteps < ActiveRecord::Migration[5.1]
  def change
    add_reference :steps, :measure, foreign_key: true
  end
end
