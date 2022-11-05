Rails.application.routes.draw do
  root to: 'sessions#new', as: :login
  get '/auth/:provider/callback', to: 'sessions#create'
  delete '/session', to: 'sessions#destroy', as: :session_delete
  resources :resources, only: :index
  resource :users, only: %i[show edit] do 
    resources :trips, only: %i[new show update destroy]
  end


end
