Rails.application.routes.draw do
  resources :vets
  resources :animals
  resources :appointments
  devise_for :users
  # root 'sessions#new'
  delete '/session/', to: 'sessions#destroy'
  get '/users/new', to: 'users#new', as: 'new_user'
  get '/users', to:'users#index', as: 'users'
  get '/users/:id', to: 'users#show', as: 'user'
  get '/appointments', to: 'appointments#index', as: 'appointments'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
