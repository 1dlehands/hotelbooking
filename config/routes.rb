SendGridInn::Application.routes.draw do

  root to: 'rooms#index'
  get "rooms/index"

  get "users/new"
  
  resources :users, only: [:new, :create, :edit, :show, :destroy]
  resources :sessions, only: [:new, :create, :destroy]
  resources :rooms
  
  match '/signup', to: 'users#new'
  match '/signin', to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete


end
