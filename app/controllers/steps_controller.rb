class StepsController < ApplicationController

  before_action :find_recipe, except: [ :index ]
  before_action :find_step, except: [ :index, :new, :create  ]

  def index
    @recipe = Recipe.find(params[:id])
    @steps = Step.where(recipe_id: @recipe.id)
  end

  def new
    @step = Step.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @step = Step.new(step_params)
    @step.recipe = @recipe
    if @step.save
      respond_to do |format|
        format.html { redirect_to recipe_path(@recipe) }
        format.js
      end
    else
      render 'recipes/show'
    end
  end

  def edit
    respond_to do |format|
      format.html { redirect_to edit_recipe_step_path(@recipe, @step) }
      format.js
    end
  end

  def update
    @step.update(step_params)
    respond_to do |format|
      format.html { redirect_to recipe_path(@recipe) }
      format.js
    end
  end

  def destroy
    @step.destroy
    respond_to do |format|
      format.html { redirect_to recipe_step_path(@recipe, @step) }
      format.js
    end
  end

  private

  def step_params
    params.require(:step).permit(:instructions)
  end

  def find_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  def find_step
    @step = Step.find(params[:id])
  end
end
