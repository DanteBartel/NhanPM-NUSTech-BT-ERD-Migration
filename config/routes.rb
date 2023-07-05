Rails.application.routes.draw do  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "temps#signup"
  get "/temps/signup", to: "temps#signup"
end
