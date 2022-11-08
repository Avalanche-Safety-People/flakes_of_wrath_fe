Rails.application.routes.draw do
  root to: 'sessions#new', as: :login
  get '/auth/:provider/callback', to: 'sessions#create'
  delete '/session', to: 'sessions#destroy', as: :session_delete
  resources :resources, only: :index
  resource :users do 
    resources :emergency_contacts
    resources :trips
  end

  resources :areas, only: [:index, :show]
end
