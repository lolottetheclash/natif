Rails.application.routes.draw do

  root 'variants#index' 
  
  resources :variants
  resources :wishlists
  resources :reviews
  resources :orders
  resources :items
  devise_for :users

  get '/carts/payment' => 'carts#payment'
  resources :carts
  get '/add_to_carts/:id' => 'carts#additem', as: 'addtocart'
  get '/remove_from_carts/:id' => 'carts#removeitem', as: 'removefromcart'

  resources :posts
  get "/index_list.html.erb", to: "posts#index_list"

end
