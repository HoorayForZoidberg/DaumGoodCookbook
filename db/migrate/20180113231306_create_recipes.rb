class CreateRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :summary, null: true
      t.references :owner, references: :users

      t.timestamps
    end

    add_foreign_key :recipes, :users, column: :owner_id
  end
end
