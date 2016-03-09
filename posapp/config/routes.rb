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

  delete '/apikeys/:id/delete' =>  'apikeys#delete'

  get '/admin' => 'admin#show'
  delete '/admin/:id/delete' => 'admin#delete'

  get '/authenticate' => 'sessions#authenticate'

  get '/auth/twitter/callback' => 'sessions#create_for_api'

  get '/apikey=:apikey/events' => 'events#index'

  get '/apikey=:apikey/events/:eventID' =>'events#get_single_event'

  get '/apikey=:apikey/events/offset=:offset/limit=:limit' => 'events#get_offset_and_limit'

  get '/apikey=:apikey/notvalidapikey' => 'message#not_valid_key', as: :api_not_valid_key

end