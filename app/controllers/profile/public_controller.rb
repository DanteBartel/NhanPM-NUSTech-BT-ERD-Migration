class Profile::PublicController < ApplicationController
    def photos
        @user = User.includes(:photos, :followers).find(params[:id])
        @photos = @user.photos.where(is_public: true).order(created_at: :desc).page(params[:page]).per(20)
        @followers = @user.followers
    end

    def albums
        @user = User.includes(:albums, :followers).find(params[:id])
        @albums = @user.albums.where(is_public: true).order(created_at: :desc).page(params[:page]).per(20)
        @followers = @user.followers
    end

    def followees
        @user = User.includes(:follows_as_follower, :followers).find(params[:id])
        @follows_as_follower = @user.follows_as_follower.includes(followee: :followers).page(params[:page]).per(20)
        @followers = @user.followers
    end

    def followers
        @user = User.includes(:follows_as_followee, :followers).find(params[:id])
        @follows_as_followee = @user.follows_as_followee.includes(follower: :followers).page(params[:page]).per(20)
        @followers = @user.followers
    end
end
