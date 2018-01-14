class ChangeStepNumberTypeInSteps < ActiveRecord::Migration[5.1]
  def self.up
    change_column :steps, :step_number, 'integer USING CAST(step_number AS integer)'
  end

  def self.down
    change_column :steps, :step_number, 'text USING CAST(step_number AS integer)'
  end
end
