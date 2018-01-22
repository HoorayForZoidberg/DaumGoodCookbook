class CommentsController < ApplicationController
  before_action :find_recipe
  before_action :find_comment, except: [ :create ]

  def create
    @comment = Comment.new(comment_params)
    @comment.recipe = @recipe
    @comment.owner_id = current_user.id
    if @comment.save
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
      format.html { redirect_to edit_recipe_comment_path(@recipe, @comment) }
      format.js
    end
  end

  def update
    @comment.update(comment_params)
    respond_to do |format|
      format.html { redirect_to recipe_path(@recipe) }
      format.js
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to recipe_comment_path(@recipe, @comment) }
      format.js
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def find_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  def find_comment
    @comment = Comment.find(params[:id])
  end
end
