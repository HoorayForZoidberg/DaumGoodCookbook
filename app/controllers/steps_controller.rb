class StepsController < ApplicationController

  before_action :find_recipe, except: [ :index ]
  before_action :find_step, except: [ :index, :new, :create, :sort  ]

  def index
    @recipe = Recipe.find(params[:id])
    @steps = Step.where(recipe_id: @recipe.id).order(:position)
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
    @step.position = (Step.where("recipe_id = ?", @recipe.id).count + 1)
    if @step.save
      @step = Step.new
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

  def sort
    params[:step].each_with_index do |id, index|
        Step.where(id: id).update_all(position: index + 1)
    end

    head :ok
  end

  private

  def step_params
    params.require(:step).permit(:instructions, :position)
  end

  def find_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  def find_step
    @step = Step.find(params[:id])
  end
end
