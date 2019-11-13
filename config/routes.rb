Rails.application.routes.draw do
  resources :add_languages_to_locations
  resources :padders
  resources :requests, only: [:new, :create, :show]
  resources :locations, only: [:index, :show]
  
  

  get "/signups", to: "padders#new", as: "signup"
  post "/signups", to: "padders#create"
  get "/login", to: "sessions#new", as: "login"
  post "sessions", to: "sessions#create", as: "sessions"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
