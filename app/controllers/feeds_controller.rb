class FeedsController < ApplicationController
    def feeds_photos        
        # console.log(flash.any?)
        if flash[:notice]
            p flash[:notice]
            redirect_to "/profile/edit"
        end
    end
    def discover_photos

    end
    def feeds_albums

    end
    def discover_albums

    end
end
