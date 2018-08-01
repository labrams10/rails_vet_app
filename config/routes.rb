Rails.application.routes.draw do
  resources :vets
  resources :animals
  devise_for :users
  resources :users do
    resources :animals
    resources :appointments
  end

  root "static_pages#home"
  delete '/session/', to: 'sessions#destroy'
  get '/appointments', to: 'appointments#index', as: 'appointments'
  get '/appointments/:id/edit', to: 'appointments#edit', as: 'edit_appointment'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
