Rails.application.routes.draw do

  resources :wishlists
  resources :variants
  resources :posts
  resources :reviews
  resources :carts
  resources :items
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
