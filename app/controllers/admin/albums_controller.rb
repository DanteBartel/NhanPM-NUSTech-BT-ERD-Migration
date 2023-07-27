class Admin::AlbumsController < ApplicationController
    def index
        albums = Album.all.order(created_at: :desc)
        @pagy, @albums = pagy(albums.all, items: ADMIN_ITEMS_PER_PAGE)
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
        redirect_to "/admin/albums/" + params[:id] + "/edit"
    end

    def destroy
        album = Album.find(params[:id])
        if album.destroy!
            redirect_to "/admin/albums"
        end
    end

    def dropImage
        album_id = params[:album_id]
        image_id = params[:image_id]
        img = Album.find(album_id.to_i).images[image_id.to_i]
        if img.purge
            redirect_to "/admin/albums/" + params[:album_id] + "/edit"
        end
    end


    # ----------------------------------------------------------------
    private

    def update_album_params
        params.permit(:title, :description, :is_public)
    end

    def add_album_image_params
        params[:image]
    end
end
