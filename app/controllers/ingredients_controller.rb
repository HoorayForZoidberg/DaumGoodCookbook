class IngredientsController < ApplicationController

  before_action :find_ingredient, except: [ :index, :new, :create ]

  def index
    @ingredients = Ingredient.order('LOWER(name)')
  end

  def show
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      redirect_to ingredient_path(@ingredient)
    else
      render 'ingredients/show'
    end
  end

  def edit
  end

  def update
    @ingredient.update(ingredient_params)
    redirect_to ingredient_path(@ingredient)
  end

  def destroy
    @ingredient.destroy
    redirect_to ingredients_path
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name, :description)
  end

  def find_ingredient
    @ingredient = Ingredient.find(params[:id])
  end
end
