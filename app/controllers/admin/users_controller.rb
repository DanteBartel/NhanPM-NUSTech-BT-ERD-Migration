class Admin::UsersController < ApplicationController
    def index
        @users = User.all.where(is_admin: false).order(created_at: :desc).page(params[:page]).per(40)
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        # Edit info
        user = User.find(params[:id])
        user.update!(edit_user_params)
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
        redirect_back fallback_location: "/"
    end


    # ----------------------------------------------------------------
    private

    def edit_user_params
        if params[:password].blank?
            params.permit(:fname, :lname, :email, :is_active)
        else
            params.permit(:fname, :lname, :email, :is_active, :password, :password_confirmation)
        end
    end
end
