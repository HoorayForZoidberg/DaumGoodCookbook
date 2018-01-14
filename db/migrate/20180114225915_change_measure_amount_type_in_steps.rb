class ChangeMeasureAmountTypeInSteps < ActiveRecord::Migration[5.1]
  def self.up
    change_column :steps, :measure_amount, 'integer USING CAST(measure_amount AS integer)'
  end

  def self.down
    change_column :steps, :measure_amount, 'text USING CAST(measure_amount AS integer)'
  end
end
