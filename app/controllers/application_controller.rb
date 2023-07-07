class ApplicationController < ActionController::Base
    def after_sign_in_path_for(users)
        # grid_index_path
        "/temps/feed"
    end
end
