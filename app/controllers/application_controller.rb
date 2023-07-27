class ApplicationController < ActionController::Base
    include Pagy::Backend

    def after_sign_in_path_for(users)
        "/passthrough/index"
    end
end
