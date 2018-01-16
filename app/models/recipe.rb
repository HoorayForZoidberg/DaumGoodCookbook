class Recipe < ApplicationRecord
  has_many :steps, dependent: :destroy
  has_many :ingredients
  has_many :comments, dependent: :destroy

  def owner
    return User.find(self.owner_id).name
  end
end
