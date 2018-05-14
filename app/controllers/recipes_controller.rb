class RecipesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :load_categories, only: [:index, :new, :edit]

  def index
    @navbar_title = "Recipes"
    @recipes = Recipe.order('LOWER(name)').includes(:user)
    if params[:query].present?
      @results = Recipe.search(params[:query])
      # add logic for al situations (empty params with category or ingredient or both or all three)
    end

  end

  def show
    @recipe = Recipe.find(params[:id])
    @ingredients = @recipe.ingredients
  end

  def new
    @navbar_title = "New Recipe"
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.owner_id = current_user.id
    if @recipe.save
      redirect_to recipe_path(@recipe)
    end
  end

  def edit
    @navbar_title = "Edit Recipe"
    @recipe = Recipe.find(params[:id])
    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(recipe_params)
    respond_to do |format|
      format.html { redirect_to recipe_path(@recipe) }
      format.js
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy

    redirect_to recipes_path
  end

  def new_recipe_ingredient
    load_new_recipe_ingredient_params
  end

  def create_recipe_ingredient
    @recipe = Recipe.find(params[:recipe_id])
    @ingredients = @recipe.ingredients
    @recipe_ingredient = RecipeIngredient.new(recipe_ingredient_params)
    if @recipe_ingredient.save!
      respond_to do |format|
        format.html { redirect_to recipe_path(params[:recipe_id]) }
        format.js
      end
    end
  end

  def add_new_ingredient
    @recipe = Recipe.find(params[:recipe_id])
    @ingredients = @recipe.ingredients
    @new_ingredient = Ingredient.new(new_ingredient_params)
    if @new_ingredient.save!
    # @recipe_ingredient = RecipeIngredient.new(recipe_id: params[:recipe_id], ingredient_id: Ingredient.where(name: params[:ingredient][:name])[0].id)
    # if @recipe_ingredient.save!
      load_new_recipe_ingredient_params
      respond_to do |format|
        format.html { redirect_to recipe_path(params[:recipe_id]) }
        format.js
      end
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :category_id)
  end

  def recipe_ingredient_params
    params.permit(:recipe_id)
    params.require(:recipe_ingredient).permit(:ingredient_id, :measure_id, :measure_amount)
    return { recipe_id: params[:recipe_id], ingredient_id: params[:recipe_ingredient][:ingredient_id], measure_id: params[:recipe_ingredient][:measure_id], measure_amount: params[:recipe_ingredient][:measure_amount] }
  end

  def new_ingredient_params
    params.require(:ingredient).permit(:name)
    return { name: params[:ingredient][:name] }
  end

  def load_new_recipe_ingredient_params
    @new_ingredient = Ingredient.new
    @new_recipe_ingredient = RecipeIngredient.new
    @ingredients = Ingredient.all.order(:name).map{ |ing| [ing.name, ing.id] } #formatted as double array for simple_form_for
    @measures = Measure.all.order(:name).map{ |measure| [measure.name, measure.id] }
  end

  def load_categories
    @categories = %W(Breakfast Breads\ &\ Rolls Appetizers Soups Meat
    Fish\ &\ Seafood Vegetables\ &\ Sides Salads Pies Cakes Cookies Desserts
    Candies\ &\ Jams Sauces\ &\ Rubs Ice\ Creams\ &\ Sorbets Miscellaneous)
  end

end
