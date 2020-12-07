Rails.application.routes.draw do

get '/' => 'sessions#welcome'
get '/login' => 'sessions#new'
post '/login' => 'sessions#create'
get '/signup' => 'dancers#new'
post '/signup' => 'dancers#create'

delete '/logout' => 'sessions#destroy'

get '/auth/:provider/callback' => 'sessions#create'

  resources :comments
  resources :dance_classes do
    resources :comments, only: [:new, :index]  
  end

  resources :dancers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
