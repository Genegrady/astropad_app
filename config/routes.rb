Rails.application.routes.draw do
  resources :padders, only: [:index, :show, :new, :create, :edit, :update, :delete]
  resources :requests, only: [:new, :create, :show]
  resources :locations, only: [:index, :show]
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
