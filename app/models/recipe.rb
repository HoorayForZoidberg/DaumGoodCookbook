class Recipe < ApplicationRecord
  belongs_to :user, foreign_key: "owner_id"
  has_many :steps, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :recipe_ingredients, dependent: :destroy
  has_many :ingredients, through: :recipe_ingredients, extend: IngredientMeasure

  validates :name, presence: true
  validates :category, presence: true

  # include AlgoliaSearch

  # algoliasearch do
  #   attribute :name, :category
  #   attribute :ingredients do
  #     ingredients.each do |ingredient|
  #       { ingredient: ingredient.name }
  #     end
  #   end
  #   attribute :steps do
  #     steps.each do |s|
  #       { instructions: s.instructions }
  #     end
  #   end
  #   attribute :user do
  #     { user_name: user.name }
  #   end

  #   searchableAttributes ['unordered(name)', 'unordered(ingredient)',
  #    'unordered(instructions)', 'unordered(user_name)', 'unordered(category)']
  # end

  include PgSearch

  pg_search_scope :search,
    against: [ :name, :category ],
    associated_against: {
      steps: :instructions,
      ingredients: :name
    },
    using: {
      tsearch: {
        prefix: true,
        dictionary: "english",
        any_word: true
      }
    }

  def owner
    return User.find(self.owner_id).name
  end
end
