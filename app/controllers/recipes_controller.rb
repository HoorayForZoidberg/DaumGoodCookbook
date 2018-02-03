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
    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name)
  end
end
