class Recipe < ApplicationRecord

  belongs_to :user, foreign_key: "owner_id"
  belongs_to :category
  has_many :steps, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :recipe_ingredients, dependent: :destroy
  has_many :ingredients, through: :recipe_ingredients, extend: IngredientMeasure

  validates :name, presence: true
  validates :category_id, presence: true

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
