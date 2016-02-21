Rails.application.routes.draw do
  get 'users/' => 'users#index'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#api_auth'
end