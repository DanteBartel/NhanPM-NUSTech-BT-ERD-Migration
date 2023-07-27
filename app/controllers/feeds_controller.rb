class FeedsController < ApplicationController
    def feeds_photos        
        fs = Follow.where(follower_id: current_user.id)
        followee_ids = fs.pluck(:followee_id)
        photos = Photo.includes(:like_photos, :user).where(user_id: followee_ids, is_public: true).order(created_at: :desc)
        @pagy, @photos = pagy(photos.all, items: ITEMS_PER_PAGE)
    end

    def discover_photos
        photos = Photo.includes(:like_photos, user: :followers).where(is_public: true).order(created_at: :desc)
        @pagy, @photos = pagy(photos.all, items: ITEMS_PER_PAGE)
    end

    def feeds_albums
        fs = Follow.where(follower_id: current_user.id)
        followee_ids = fs.pluck(:followee_id)
        albums = Album.includes(:like_albums, :user).where(user_id: followee_ids, is_public: true).order(created_at: :desc)
        @pagy, @albums = pagy(albums.all, items: ITEMS_PER_PAGE)
    end

    def discover_albums
        albums = Album.includes(:like_albums, user: :followers).where(is_public: true).order(created_at: :desc)
        @pagy, @albums = pagy(albums.all, items: ITEMS_PER_PAGE)
    end
end
