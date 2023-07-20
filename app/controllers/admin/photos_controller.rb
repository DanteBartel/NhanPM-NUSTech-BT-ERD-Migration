class Admin::PhotosController < ApplicationController
    def index
        @photos = Photo.all.order(created_at: :desc).page(params[:page]).per(40)
    end
end
