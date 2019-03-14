Rails.application.routes.draw do

  root 'variants#index' 
  
  resources :variants
  resources :wishlists
  resources :reviews
  resources :items

  resources :posts
  get "/index_list.html.erb", to: "posts#index_list"


 
  resources :carts
  get '/add_to_carts/:id' => 'carts#additem', as: 'addtocart'
  get '/remove_from_carts/:id' => 'carts#removeitem', as: 'removefromcart'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users

end
