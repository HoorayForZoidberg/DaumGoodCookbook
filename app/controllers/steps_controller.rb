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

private

def step_params
  params.require(:step).permit(:instructions)
end

end
