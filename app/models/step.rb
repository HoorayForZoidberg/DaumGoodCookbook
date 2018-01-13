class Step < ApplicationRecord
  belongs_to :recipe
  has_many :ingredients
  has_many :measures

end
