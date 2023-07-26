Rails.application.routes.draw do  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # routes for devise
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: "users/registrations" }
  as :user do
    get '/' => 'users/sessions#new'
  end

  # routes for directing to passthrough controller after login
  get "/passthrough/index", to: "passthrough#index"
  namespace :admin do
    resources :photos, :albums, :users
  end
  delete "/admin/albums/:album_id/image/:image_id", to: "admin/albums#dropImage"

  # Routes for the feeds
  get "/feeds/feeds_photos", to: "feeds#feeds_photos"
  get "/feeds/discover_photos", to: "feeds#discover_photos"
  get "/feeds/feeds_albums", to: "feeds#feeds_albums"
  get "/feeds/discover_albums", to: "feeds#discover_albums"

  # Routes for personal profiles
  put "/profile/edit", to: "profile/personal#edit"
  get "/profile/photos", to: "profile/personal#photos"
  get "/profile/albums", to: "profile/personal#albums"
  get "/profile/followees", to: "profile/personal#followees"
  get "/profile/followers", to: "profile/personal#followers"

  # Routes for follow and unfollow
  delete "/profile/unfollow/:user_id", to: "profile/personal#unfollow"
  post "/profile/follow/:user_id", to: "profile/personal#follow"

  # Routes for public profiles
  get "/profile/:id/photos", to: "profile/public#photos"
  get "/profile/:id/albums", to: "profile/public#albums"
  get "/profile/:id/followees", to: "profile/public#followees"
  get "/profile/:id/followers", to: "profile/public#followers"

  # Routes for passing through the public profiles url
  get "/passthrough/go_to_public_profile/:id", to: "passthrough#go_to_public_profile"
  get "/passthrough/go_to_public_photos/:user_id", to: "passthrough#go_to_public_photos"
  get "/passthrough/go_to_public_albums/:user_id", to: "passthrough#go_to_public_albums"

  # Routes for like and unlike photos / albums
  post "/profile/like_photo/:photo_id", to: "profile/personal#like_photo"
  delete "/profile/unlike_photo/:photo_id", to: "profile/personal#unlike_photo"
  post "/profile/like_album/:album_id", to: "profile/personal#like_album"
  delete "/profile/unlike_album/:album_id", to: "profile/personal#unlike_album"

  # Routes for CRUD photos
  resources :users do
    resources :photos, only: [:new, :create]
    resources :albums, only: [:new, :create]
  end
  resources :photos, only: [:edit, :update, :destroy]
  resources :albums, only: [:edit, :update, :destroy]
  delete "/albums/:album_id/image/:image_id", to: "albums#dropImage"

end
