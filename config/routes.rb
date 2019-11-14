Rails.application.routes.draw do
  resources :padders do
  resources :requests
  end
  resources :locations, only: [:index, :show]
  
  

  get "/signups", to: "padders#new", as: "signup"
  post "/signups", to: "padders#create"
  get "/login", to: "sessions#new", as: "login"
  post "login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy", as: "logout"
  patch "/accept/:id", to: "requests#accept"
  patch "/decline/:id", to: "requests#decline"
  post "/padders/:padder_id/requests/new", to: "requests#create"
  get "/padders/:padder_id/requests/:id", to: "requests#show"
  delete "/requests/:id", to: "requests#delete"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
