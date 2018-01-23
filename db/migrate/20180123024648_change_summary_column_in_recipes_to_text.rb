class ChangeSummaryColumnInRecipesToText < ActiveRecord::Migration[5.1]
  def change
    change_column :recipes, :summary, :text
  end
end
