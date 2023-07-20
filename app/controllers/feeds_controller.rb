class FeedsController < ApplicationController
    def feeds_photos        
        
    end

    def discover_photos
        @photos = Photo.includes(:like_photos).where(is_public: true).order(created_at: :desc)
    end

    def feeds_albums

    end

    def discover_albums
        @albums = Album.includes(:like_albums).where(is_public: true).order(created_at: :desc)
    end
end
