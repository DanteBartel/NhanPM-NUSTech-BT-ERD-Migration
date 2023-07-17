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
        if add_album_image_params
            album.images.attach(add_album_image_params)
        end
        redirect_to "/albums/" + params[:id] + "/edit"
    end

    def destroy
        album = Album.find(params[:id])
        if album.destroy!
            redirect_to "/profile/albums"
        end
    end

    def dropImage
        album_id = params[:album_id]
        image_id = params[:image_id]
        img = Album.find(album_id.to_i).images[image_id.to_i]
        if img.purge
            redirect_to "/albums/" + params[:album_id] + "/edit"
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

    def add_album_image_params
        params[:image]
    end
end
