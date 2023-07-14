class Profile::PersonalController < ApplicationController
    def photos
        user = User.includes(:photos).find(current_user.id)
        @photos = user.photos
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
