Rails.application.routes.draw do
  resources :comments
  resources :dance_classes
  resources :categories
  resources :dancers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
