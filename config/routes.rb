Rails.application.routes.draw do  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # routes for devise
  devise_for :users
  as :user do
    get '/' => 'devise/sessions#new'
  end

  # routes for directing to passthrough controller after login
  get "/passthrough/index", to: "passthrough#index"
  get "/temps/manage_photo", to: "temps#manage_photo"

  # Routes for the feeds
  get "/feeds/feeds_photos", to: "feeds#feeds_photos"
  get "/feeds/discover_photos", to: "feeds#discover_photos"
  get "/feeds/feeds_albums", to: "feeds#feeds_albums"
  get "/feeds/discover_albums", to: "feeds#discover_albums"

  # Routes for profiles
  get "/users/:user_id/photos", to: "users#"

  # temps route when first init this project
  get "/temps/signup", to: "temps#signup"
  get "/temps/login", to: "temps#login"
  get "/temps/feed", to: "temps#feed"
  get "/temps/feed_album", to: "temps#feed_album"
  get "/temps/my_photo", to: "temps#my_photo"
  get "/temps/my_album", to: "temps#my_album"
  get "/temps/new_photo", to: "temps#new_photo"
  get "/temps/edit_photo", to: "temps#edit_photo"
end
