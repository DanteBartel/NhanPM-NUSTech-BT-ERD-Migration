class Admin::AlbumsController < ApplicationController
    def index
        @albums = Album.all.order(created_at: :desc).page(params[:page]).per(40)
    end
end
