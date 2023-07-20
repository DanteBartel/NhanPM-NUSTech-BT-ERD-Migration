class PassthroughController < ApplicationController
    def index
        path = case current_user_role
            when 'not_signed_in'
                "/temps/feed"
            when 'user'
                "/feeds/feeds_photos"
            when 'admin'
                "/admin/photos"
        end  
        redirect_to path
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