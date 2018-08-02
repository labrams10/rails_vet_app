Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :vets
  resources :animals
  resources :users do
    resources :animals
    resources :appointments
  end
  resources :users

  root "static_pages#home"
  delete '/session/', to: 'sessions#destroy'
  get '/appointments', to: 'appointments#index', as: 'appointments'
  get '/appointments/:id/edit', to: 'appointments#edit', as: 'edit_appointment'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
