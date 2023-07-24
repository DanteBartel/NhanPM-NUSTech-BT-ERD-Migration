class Profile::PublicController < ApplicationController
    def photos
        @user = User.includes(:photos).find(params[:id])
        @photos = @user.photos.where(is_public: true).order(created_at: :desc).page(params[:page]).per(20)
    end

    def albums
        @user = User.includes(:albums).find(params[:id])
        @albums = @user.albums.where(is_public: true).order(created_at: :desc).page(params[:page]).per(20)
    end

    def followees
        @user = User.includes(:follows_as_follower).find(params[:id])
        @follows_as_follower = @user.follows_as_follower.page(params[:page]).per(20)
    end

    def followers
        @user = User.includes(:follows_as_followee).find(params[:id])
        @follows_as_followee = @user.follows_as_followee.page(params[:page]).per(20)
    end
end
