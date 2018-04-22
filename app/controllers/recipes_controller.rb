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
    @new_ingredient = Ingredient.new
    @new_recipe_ingredient = RecipeIngredient.new
    @ingredients = Ingredient.all.order(:name).map{ |ing| [ing.name, ing.id] } #formatted as double array for simple_form_for
    @measures = Measure.all.order(:name).map{ |measure| [measure.name, measure.id] }
  end

  def create_recipe_ingredient
    @recipe = Recipe.find(params[:recipe_id])
    @ingredients = @recipe.ingredients
    @recipe_ingredient = RecipeIngredient.new(recipe_id: @recipe.id, ingredient_id: params[:recipe_ingredient][:ingredient_id], measure_id: params[:measure_id], measure_amount: params[:measure_amount])
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
    @new_ingredient = Ingredient.new(name: params[:ingredient][:name])
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
    params.require(:recipe).permit(:name)
  end

  def load_new_recipe_ingredient_params
    @new_recipe_ingredient = RecipeIngredient.new
    @ingredients = Ingredient.all.order(:name).map{ |ing| [ing.name, ing.id] } #formatted as double array for simple_form_for
    @measures = Measure.all.order(:name).map{ |measure| [measure.name, measure.id] }
  end

end
