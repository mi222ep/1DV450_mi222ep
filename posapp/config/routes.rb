Rails.application.routes.draw do
  get 'logout' => 'sessions#logout', as: :logout
  get 'register' => 'users#new'
  post 'register' => 'users#register'
  get 'users/' => 'users#index'
  get '/login' => 'sessions#new', as: :login
  post '/login' => 'sessions#create'

  get '/apikeys' => 'apikeys#new'
  post '/apikeys' => 'apikeys#create'
end