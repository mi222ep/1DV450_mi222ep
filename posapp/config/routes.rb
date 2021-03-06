Rails.application.routes.draw do

  get "/" => 'sessions#new', as: :login
  post "/" => "sessions#create"

  get 'register' => 'users#new'
  post 'register' => 'users#register'
  get 'users/' => 'users#index'

  get '/apikeys' => 'apikeys#new'
  post '/apikeys' => 'apikeys#create'

  get '/showallkeys' => 'apikeys#show', as: :keys

  get '/logout' => 'sessions#destroy'

  delete '/apikeys/:id/delete' => 'apikeys#delete'

  get '/admin' => 'admin#show'
  delete '/admin/:id/delete' => 'admin#delete'

  get '/authenticate' => 'sessions#authenticate'

  get '/auth/twitter/callback' => 'sessions#create_for_api'

  get '/notvalidapikey' => 'message#not_valid_key', as: :api_not_valid_key

  get '/test/' => 'sessions#test'

  get '/events/nearby' => 'events#nearby'

  get '/tag/:id' => 'events#get_by_tag'

  resources :events, only: [:new, :create, :index, :show, :update, :destroy]

  get '/events/searchbyname/:name' => 'events#event_by_name'
  get '/logout-api' => 'sessions#destroy_api_auth'

end