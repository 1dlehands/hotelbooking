SendGridInn::Application.routes.draw do

  root to: 'rooms#index'

  resources :rooms
  get 'users/new'
  resources :bookings, only: [:create, :destroy]
  
  resources :users, only: [:new, :create, :edit, :show, :destroy]
  resources :sessions, only: [:new, :create, :destroy]

  
  match '/signup', to: 'users#new'
  match '/signin', to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete


end
