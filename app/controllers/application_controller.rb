class ApplicationController < ActionController::Base
    include Pagy::Backend

    def after_sign_in_path_for(users)
        "/passthrough/index"
    end
    
    def after_sign_out_path_for(users)
        "/users/sign_in"
    end
    
end
