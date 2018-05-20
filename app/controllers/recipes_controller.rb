class RecipesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :convert_input_times, only: [:create, :update]

  def index
    @navbar_title = "Recipes"
    if params[:query] && params[:query] == ""
      @results = Recipe.all.includes(:user, :category, :photos)
    elsif params[:query]
      @results = Recipe.search(params[:query]).includes(:user, :category, :photos)
    end
    if params[:category_id].present?
      @results = @results.search_by_category(params[:category_id])
      if params[:ingredient_id].present?
        @results = @results.search_by_ingredient(params[:ingredient_id])
      end
    elsif params[:ingredient_id].present?
      @results = @results.search_by_ingredient(params[:ingredient_id])
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    if @recipe.photos.empty?
      @recipe_photo_id = "cooking_image_#{rand(10..23)}"
    else
      @recipe_photo_id = random_recipe_photo_from_owner(@recipe).image_id
    end
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
    display_input_times
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

  def destroy_recipe_ingredient
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_ingredient = RecipeIngredient.find(params[:recipe_ingredient_id])
    if @recipe_ingredient.destroy!
      @ingredients = @recipe.ingredients
      respond_to do |format|
        format.html { redirect_to recipe_path(@recipe) }
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

  def add_new_measure
    @recipe = Recipe.find(params[:recipe_id])
    @ingredients = @recipe.ingredients
    @new_measure = Measure.new(new_measure_params)
    if @new_measure.save!
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
    params.require(:recipe).permit(:name, :category_id, :prep_time, :cook_time, :rest_time)
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

  def new_measure_params
    params.require(:measure).permit(:name)
    return { name: params[:measure][:name] }
  end

  def load_new_recipe_ingredient_params
    @new_ingredient = Ingredient.new
    @new_measure = Measure.new
    @new_recipe_ingredient = RecipeIngredient.new
    @ingredients = Ingredient.all.order(:name).map{ |ing| [ing.name, ing.id] } #formatted as double array for simple_form_for
    @measures = Measure.all.order(:name).map{ |measure| [measure.name, measure.id] }
  end

  def random_recipe_photo_from_owner(recipe)
    recipe.photos.where(user_id: recipe.owner_id).sample
  end

  def convert_input_times
    params[:recipe][:prep_time] = ChronicDuration.parse(params[:recipe][:prep_time], keep_zero: true)
    params[:recipe][:cook_time] = ChronicDuration.parse(params[:recipe][:cook_time], keep_zero: true)
    params[:recipe][:rest_time] = ChronicDuration.parse(params[:recipe][:rest_time], keep_zero: true)
  end

  def display_input_times
    @recipe.prep_time = ChronicDuration.output(@recipe.prep_time)
    @recipe.cook_time = ChronicDuration.output(@recipe.cook_time)
    @recipe.rest_time = ChronicDuration.output(@recipe.rest_time)
  end
end
