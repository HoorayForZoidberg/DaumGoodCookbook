class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
    @ingredients = @recipe.ingredients
    @comment = Comment.new
    @step = Step.new
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.owner_id = current_user.id
    @recipe.save

    redirect_to recipe_path(@recipe)
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(recipe_params)

    redirect_to recipe_path(@recipe)
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy

    redirect_to recipes_path
  end

  def new_recipe_ingredient
    @new_recipe_ingredient = RecipeIngredient.new
    @ingredients = Ingredient.all.map{ |ing| [ing.name, ing.id] } #formatted as double array for simple_form_for
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create_recipe_ingredient
    @recipe_ingredient = Ingredient.new(recipe_id: params[:recipe_id], ingredient_id: params[:id])
    @recipe_ingredient.save
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name)
  end
end
