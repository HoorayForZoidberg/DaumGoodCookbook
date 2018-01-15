class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
    @comment = Comment.new
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.save

    redirect_to recipe_path(@recipe)
  end

  def method_name

  end

  private

  def recipe_params
    params.require(:recipe).permit(:name)
  end
end
