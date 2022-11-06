Rails.application.routes.draw do
  root to: 'sessions#new', as: :login
  get '/auth/:provider/callback', to: 'sessions#create'
  delete '/session', to: 'sessions#destroy', as: :session_delete
  resources :resources, only: :index
  resource :users do 
    resources :trips
  end


end
