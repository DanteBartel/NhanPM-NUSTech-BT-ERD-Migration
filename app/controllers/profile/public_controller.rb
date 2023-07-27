class Profile::PublicController < ApplicationController
    def photos
        @user = User.includes(:photos, :followers).find(params[:id])
        photos = @user.photos.where(is_public: true).order(created_at: :desc)
        @followers = @user.followers
        @pagy, @photos = pagy(photos.all, items: PROFILE_ITEMS_PER_PAGE)
    end

    def albums
        @user = User.includes(:albums, :followers).find(params[:id])
        albums = @user.albums.where(is_public: true).order(created_at: :desc)
        @followers = @user.followers
        @pagy, @albums = pagy(albums.all, items: PROFILE_ITEMS_PER_PAGE)
    end

    def followees
        @user = User.includes(:follows_as_follower, :followers).find(params[:id])
        follows_as_follower = @user.follows_as_follower.includes(followee: :followers)
        @followers = @user.followers
        @pagy, @follows_as_follower = pagy(follows_as_follower.all, items: PROFILE_ITEMS_PER_PAGE)
    end

    def followers
        @user = User.includes(:follows_as_followee, :followers).find(params[:id])
        follows_as_followee = @user.follows_as_followee.includes(follower: :followers)
        @followers = @user.followers
        @pagy, @follows_as_followee = pagy(follows_as_followee.all, items: PROFILE_ITEMS_PER_PAGE)
    end
end
