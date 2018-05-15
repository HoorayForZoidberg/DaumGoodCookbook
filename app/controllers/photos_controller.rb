class PhotosController < ApplicationController
  # def new
  #   respond_to do |format|
  #     format.js { render partial: 'shared/photo_upload.js.erb'}
  #     format.html { redirect_to 'shared/photo_upload' }
  #   end
  # end

  def create
    @photo = Photo.new
    @recipe = Recipe.find(params[:recipe_id])
    @photo.image_id = params[:image_id]
    @photo.user = current_user
    @photo.recipe = Recipe.find(params[:recipe_id])
    @photo.save

    redirect_to recipe_path(@recipe)
  end
end
