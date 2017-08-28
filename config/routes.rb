Rails.application.routes.draw do
  resources :supports, only: [:index, :create, :show,:update, :destroy]
  resources :reunions, only: [:index, :create, :show,:update, :destroy]
  resources :contacts, only: [:index, :create, :show,:update, :destroy]
  resources :clients, only: [:index, :create, :show,:update, :destroy]
  resources :users, only: [:index, :create, :show, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
