class PassthroughController < ApplicationController
    def index
        path = case current_user_role
            when 'not_signed_in'
                "/feeds/discover_photos"
            when 'user'
                "/feeds/feeds_photos"
            when 'admin'
                "/admin/photos"
        end  
        redirect_to path
    end

    def go_to_public_profile
        if not user_signed_in?
            redirect_to "/profile/" + params[:id] + "/photos"
        elsif params[:id].to_i == current_user.id
            redirect_to "/profile/photos"
        else
            redirect_to "/profile/" + params[:id] + "/photos"
        end
    end

    def go_to_public_photos
        if not user_signed_in?
            redirect_to "/profile/" + params[:user_id] + "/photos"
        elsif params[:user_id].to_i == current_user.id
            redirect_to "/profile/photos"
        else
            redirect_to "/profile/" + params[:user_id] + "/photos"
        end
    end

    def go_to_public_albums
        if not user_signed_in?
            redirect_to "/profile/" + params[:user_id] + "/albums"
        elsif params[:user_id].to_i == current_user.id
            redirect_to "/profile/albums"
        else
            redirect_to "/profile/" + params[:user_id] + "/albums"
        end
    end

    private

    def current_user_role
        if not user_signed_in?
            "not_signed_in"
        elsif current_user.is_admin
            "admin"
        else
            "user"
        end
    end

end