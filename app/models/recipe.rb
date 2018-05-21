class Recipe < ApplicationRecord

  belongs_to :user, foreign_key: "owner_id"
  belongs_to :category
  has_many :photos, dependent: :destroy
  has_many :steps, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :recipe_ingredients, dependent: :destroy
  has_many :ingredients, through: :recipe_ingredients, extend: IngredientMeasure

  validates :name, presence: true
  validates :category_id, presence: true
  validates :portions, presence: true

  include PgSearch

  pg_search_scope :search,
    against: [ :name ],
    associated_against: {
      category: :name,
      steps: :instructions,
      ingredients: :name
    },
    using: {
      tsearch: {
        :prefix => true,
        :dictionary => "english",
        :any_word => true
      },
      :trigram => {
        :only => [:name],
        :threshold => 0.1
      }
    }

  pg_search_scope :search_by_category,
    against: :category_id

  pg_search_scope :search_by_ingredient,
    associated_against: {
      ingredients: :id
    }

  def owner
    return User.find(self.owner_id).name
  end
end
