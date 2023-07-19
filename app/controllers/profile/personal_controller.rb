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

    def followees
        @follows_as_follower = current_user.follows_as_follower.page(params[:page]).per(20)
    end

    def followers
        @follows_as_followee = current_user.follows_as_followee.page(params[:page]).per(20)
    end

    def follow        
        current_user.followees << User.find(params[:user_id])
        redirect_back fallback_location: "/"
    end

    def unfollow
        if params[:follow_record_id]
            follow = Follow.find(params[:follow_record_id])
            follow.destroy!
        elsif params[:follower_id]
            follow = Follow.where(followee_id: current_user.id, followee_id: params[:follower_id]).first
            follow.destroy!
        end
        redirect_back fallback_location: "/"
    end

    def like_photo
        current_user.like_photos.create(photo_id_params)
        redirect_back fallback_location: "/"
    end

    def unlike_photo
        like_photo = LikePhoto.where(user_id: current_user.id, photo_id: params[:photo_id])
        current_user.like_photos.destroy(like_photo)
        redirect_back fallback_location: "/"
    end


    # --------------------------
    private

    def edit_params
        params.permit(:fname, :lname, :email)
    end

    def edit_avatar_params
        params[:avatar]
    end

    def photo_id_params
        params.permit(:photo_id)
    end
end
