Rails.application.routes.draw do
  root "static_pages#home"
  resources :users do
    resources :animals
    resources :appointments
  end
  resources :vets

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  delete '/session/', to: 'sessions#destroy'
end
