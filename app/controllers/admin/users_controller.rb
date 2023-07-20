class Admin::UsersController < ApplicationController
    def index
        @users = User.all.where(is_admin: false).order(created_at: :desc).page(params[:page]).per(40)
    end
end
