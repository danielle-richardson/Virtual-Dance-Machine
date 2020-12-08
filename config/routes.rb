Rails.application.routes.draw do

get '/' => 'static#index'
get '/login' => 'sessions#new'
post '/login' => 'sessions#create'
get '/signup' => 'dancers#new'
delete '/logout' => 'sessions#destroy'

get '/auth/:provider/callback' => 'sessions#create'

  resources :dancers
  resources :categories, only: [:new, :index, :create]
  resources :comments
  resources :dance_classes do
    resources :comments, only: [:new, :index]  
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
