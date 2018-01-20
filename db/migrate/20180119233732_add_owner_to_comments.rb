class AddOwnerToComments < ActiveRecord::Migration[5.1]
  def change
    add_reference :comments, :owner, index: true
  end
end
