Rails.application.routes.draw do

  authenticated do
    root :to => 'variants#index', as: :authenticated
  end
  root :to => 'home#home'
  
  resources :variants
  resources :wishlists
  resources :reviews
  resources :orders
  resources :items
  resources :options
  resources :option_values
  resources :option_associations
  devise_for :users, controllers: { registrations: 'registrations' }
  devise_scope :user do 
    get "/my_profile" => "registrations#show"
  end
  
  get '/carts/payment' => 'carts#payment'
  resources :carts
  get '/add_to_carts/:id' => 'carts#additem', as: 'addtocart'
  get '/remove_from_carts/:id' => 'carts#removeitem', as: 'removefromcart'
  resources :posts
  get "/postDashboard", to: "posts#postDashboard"

end
