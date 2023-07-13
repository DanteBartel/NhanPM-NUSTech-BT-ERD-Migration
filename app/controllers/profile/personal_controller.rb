class Profile::PersonalController < ApplicationController
    def photos
        user = User.includes(:photos).find(current_user.id)
        @photos = user.photos
    end    
end
