class Admin::PhotosController < ApplicationController
    def index
        @photos = Photo.all.order(created_at: :desc).page(params[:page]).per(40)
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
          redirect_to "/admin/photos"
        end
    end

    # ----------------------------------------------------------------
    private

    def update_photo_params
        params.permit(:title, :description, :is_public)
    end

    def update_photo_image_params
        params[:image]
    end  
end
