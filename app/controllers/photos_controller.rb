class PhotosController < ApplicationController
  def new
    @photo = Photo.new
    respond_to do |format|
      format.js { render partial: 'shared/photo_upload.js.erb'}
      format.html { redirect_to 'shared/photo_upload' }
    end
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.user = current_user
    @photo.recipe = Recipe.find(params[:recipe_id])
    @photo.save

    redirect_to recipe_path(@recipe)
  end

  def edit
    @photo = Recipe.find(params[:recipe_id]).photo
  end

  def update
    @photo = Recipe.find(params[:recipe_id]).photo
    @photo.update(photo_params)
  end

  private

  def photo_params
    params.require(:photo).permit(:url, :user_id, :recipe_id)
  end
end
