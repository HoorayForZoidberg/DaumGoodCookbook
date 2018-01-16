class ChangeInstructionsColumnInStepsToText < ActiveRecord::Migration[5.1]
  def change
    change_column :steps, :instructions, :text
  end
end
