class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.text :content
      t.references :recipe, foreign_key: true
      t.references :owner, references: :users

      t.timestamps
    end

    add_foreign_key :comments, :users, column: :owner_id
  end
end
