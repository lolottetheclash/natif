Rails.application.routes.draw do
<<<<<<< HEAD
=======
  root 'items#index' 
>>>>>>> 4728f54bc4015a7f5140e12d39c4810386598749
  resources :wishlists
  resources :variants
  resources :posts
  resources :reviews
  resources :carts
  resources :items
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
