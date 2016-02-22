Rails.application.routes.draw do
  get '/register' => 'users#new'
  post '/register' =>'users#register'

  get 'users/' => 'users#index'

  get 'login/' => 'sessions#new'
  get 'login/' => 'sessions#new'
  post '/login' => 'sessions#create'

end