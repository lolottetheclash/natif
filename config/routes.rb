Rails.application.routes.draw do
  root 'variants#index' 
  resources :wishlists
  resources :variants
  resources :posts
  resources :reviews
  resources :carts
  resources :items
  devise_for :users
  get '/add_to_carts/:id' => 'carts#additem', as: 'addtocart'
  get '/remove_from_carts/:id' => 'carts#removeitem', as: 'removefromcart'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/index_list.html.erb", to: "posts#index_list"
end
