Rails.application.routes.draw do
  root "static_pages#home"
  resources :users
  post '/users/new', to: 'users#create'
    resources :users do
      resources :animals
      resources :appointments
    end
  resources :vets
  resources :animals


  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  root "static_pages#home"
  delete '/session/', to: 'sessions#destroy'
  get '/appointments', to: 'appointments#index', as: 'appointments'
  get '/appointments/:id/edit', to: 'appointments#edit', as: 'edit_appointment'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
