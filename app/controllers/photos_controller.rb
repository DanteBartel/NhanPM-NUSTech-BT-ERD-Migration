class PhotosController < ApplicationController
  def new
    @user = User.find(params[:user_id])
  end

  def create
    new_photo = Photo.new(new_photo_params)
    new_photo.image.attach(new_photo_image_params)
    if new_photo.save!
      redirect_to "/profile/photos"
    end
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    photo = Photo.find(params[:id])
    photo.update!(update_photo_params)
    if update_photo_image_params
      photo.image.purge
      photo.image.attach(update_photo_image_params)
    end
  end

  def destroy
    photo = Photo.find(params[:id])
    if photo.destroy!
      redirect_to "/profile/photos"
    end
  end

  # ----------------------------------------------------------------
  private

  def new_photo_params
    params.permit(:title, :description, :is_public, :user_id)
  end

  def new_photo_image_params
    params[:image]
  end

  def update_photo_params
    params.permit(:title, :description, :is_public)
  end

  def update_photo_image_params
    params[:image]
  end
end
