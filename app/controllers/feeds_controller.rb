class FeedsController < ApplicationController
    def feeds_photos        
        
    end

    def discover_photos
        @photos = Photo.includes(:like_photos).where(is_public: true)
        
    end

    def feeds_albums

    end

    def discover_albums

    end
end
