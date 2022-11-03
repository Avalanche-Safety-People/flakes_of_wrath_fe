Rails.application.routes.draw do
  root to: 'sessions#new', as: :login
  get '/auth/:provider/callback', to: 'sessions#create'
  resources :resources, only: :index
  resource :users

end
