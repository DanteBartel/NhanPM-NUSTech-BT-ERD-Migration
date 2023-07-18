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
        # Edit info
        user = User.find(current_user.id)
        user.update!(edit_params)        
        # Edit avatar
        if params[:avatar]
            p "========= there is params avatar"
            if user.avatar.attached?
                user.avatar.purge
            end
            user.avatar.attach(params[:avatar])
        else
            p "========= there is no params avatar"
            p params[:clearAvatar].to_i
            if params[:clearAvatar].to_i == 1
                p "================================ the params clearAvatar is true"
                user.avatar.purge
            end
        end
        redirect_to "/users/edit"
    end


    # --------------------------
    private

    def edit_params
        params.permit(:fname, :lname, :email)
    end
    def edit_avatar_params
        params[:avatar]
    end
end
