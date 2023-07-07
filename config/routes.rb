Rails.application.routes.draw do  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # routes for devise
  devise_for :users
  as :user do
    get '/' => 'devise/sessions#new'
  end

  # Defines the root path route ("/")
  # root "temps#feed"
  get "/temps/signup", to: "temps#signup"
  get "/temps/login", to: "temps#login"
  get "/temps/feed", to: "temps#feed"
  get "/temps/feed_album", to: "temps#feed_album"
  get "/temps/my_photo", to: "temps#my_photo"
  get "/temps/my_album", to: "temps#my_album"
  get "/temps/new_photo", to: "temps#new_photo"
  get "/temps/edit_photo", to: "temps#edit_photo"
end
