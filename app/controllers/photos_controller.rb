class PhotosController < ApplicationController
  def new
    @user = User.find(params[:user_id])
  end

  def create
    new_photo = Photo.new(new_photo_params)
    if new_photo.save!
      redirect_to "/profile/photos"
    end
  end

  private
  def new_photo_params
    new_photo = params.permit(:title, :description, :is_public, :photo, :user_id)
  end
end
