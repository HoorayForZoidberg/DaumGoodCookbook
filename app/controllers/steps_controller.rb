class StepsController < ApplicationController

def index
  @recipe = Recipe.find(params[:id])
  @steps = Step.where(recipe_id: @recipe.id)
end

def create
  @recipe = Recipe.find(params[:recipe_id])
  @step = Step.new(step_params)
  @step.recipe = @recipe
  if @step.save
    redirect_to recipe_path(@recipe)
  else
    render 'recipes/show'
  end
end

def edit
  @recipe = Recipe.find(params[:recipe_id])
  @step = Step.find(params[:id])

  respond_to do |format|
    format.html { redirect_to edit_recipe_step_path(@recipe, @step) }
    format.js
  end
end

def update
  @recipe = Recipe.find(params[:recipe_id])
  @step = Step.find(params[:id])
  @step.update(step_params)

  respond_to do |format|
    format.html { redirect_to recipe_path(@recipe) }
    format.js
  end
end

def destroy
  @recipe = Recipe.find(params[:recipe_id])
  @step = Step.find(params[:id])
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

end
