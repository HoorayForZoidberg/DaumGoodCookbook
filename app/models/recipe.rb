class Recipe < ApplicationRecord
  has_many :steps, dependent: :destroy
  has_many :ingredients
  has_many :comments, dependent: :destroy
end
