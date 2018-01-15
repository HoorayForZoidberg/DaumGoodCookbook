class CommentsController < ApplicationController
  def create
    @recipe = Recipe.find(params[:recipe_id])
    @comment = Comment.new(comment_params)
    @comment.recipe = @recipe
    if @comment.save
      redirect_to recipe_path(@recipe)
    else
      render 'recipes/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
