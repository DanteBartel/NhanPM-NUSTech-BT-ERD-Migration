class Profile::PersonalController < ApplicationController
    def photos
        user = User.includes(:photos).find(current_user.id)
        photos = user.photos.order(created_at: :desc)
        @pagy, @photos = pagy(photos.all, items: PROFILE_ITEMS_PER_PAGE)
    end

    def albums
        user = User.includes(:albums).find(current_user.id)
        albums = user.albums.order(created_at: :desc)
        @pagy, @albums = pagy(albums.all, items: PROFILE_ITEMS_PER_PAGE)
    end

    def edit
        # Edit info
        user = User.find(current_user.id)
        user.update!(edit_params)        
        # Edit avatar
        if params[:avatar]
            if user.avatar.attached?
                user.avatar.purge
            end
            user.avatar.attach(params[:avatar])
        else            
            if params[:clearAvatar].to_i == 1
                user.avatar.purge
            end
        end
        redirect_to "/users/edit"
    end

    def followees
        follows_as_follower = current_user.follows_as_follower
        @pagy, @follows_as_follower = pagy(follows_as_follower.all, items: PROFILE_ITEMS_PER_PAGE)
    end

    def followers
        follows_as_followee = current_user.follows_as_followee
        @pagy, @follows_as_followee = pagy(follows_as_followee.all, items: PROFILE_ITEMS_PER_PAGE)
    end

    def follow        
        current_user.followees << User.find(params[:user_id])
        redirect_back fallback_location: "/"
    end

    def unfollow
        follow = Follow.where(follower_id: current_user.id, followee_id: params[:user_id]).first
        follow.destroy!
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

    def like_album
        current_user.like_albums.create(album_id_params)
        redirect_back fallback_location: "/"
    end

    def unlike_album
        like_album = LikeAlbum.where(user_id: current_user.id, album_id: params[:album_id])
        current_user.like_albums.destroy(like_album)
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

    def album_id_params
        params.permit(:album_id)
    end
end
