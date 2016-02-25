Rails.application.routes.draw do
  get 'register' => 'users#new'
  post 'register' => 'users#register'
  get 'users/' => 'users#index'

  get '/login' => 'sessions#new', as: :login
  post '/login' => 'sessions#create'

  get '/apikeys' => 'apikeys#new'
  post '/apikeys' => 'apikeys#create'

  get '/showallkeys' => 'apikeys#show', as: :keys

  get '/logout' => 'sessions#destroy'

  delete '/apikeys/:id/delete' =>  'apikeys#delete'

  get '/admin' => 'admin#show'
  delete '/admin/:id/delete' => 'admin#delete'
end