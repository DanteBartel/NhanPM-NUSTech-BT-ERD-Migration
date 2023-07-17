class AlbumsController < ApplicationController
    def new
        @user = User.find(params[:user_id])
    end

    def create
        new_album = Album.new(new_album_params)
        new_album.images.attach(new_album_image_params)
        if new_album.save!
          redirect_to "/albums/" + new_album.id.to_s + "/edit"
        end
    end

    def edit
        @album = Album.find(params[:id])
    end

    def update
        album = Album.find(params[:id])
        album.update!(update_album_params)
    end

    def destroy
        album = Album.find(params[:id])
        if album.destroy!
            redirect_to "/profile/albums"
        end
    end




    private

    def new_album_params
        params.permit(:title, :description, :is_public, :user_id)
    end

    def new_album_image_params
        params[:image]
    end

    def update_album_params
        params.permit(:title, :description, :is_public)
    end
end
