class Profile::PersonalController < ApplicationController
    def photos
        user = User.includes(:photos).find(current_user.id)
        @photos = user.photos.order(:id).page(params[:page]).per(20)
    end
    def albums
        user = User.includes(:albums).find(current_user.id)
        @albums = user.albums
    end
    def edit
        user = User.find(current_user.id)
        user.update!(edit_params)
        redirect_to "/users/edit"
    end

    private
    def edit_params
        params.permit(:fname, :lname, :email)
    end
end
