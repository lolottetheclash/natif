Rails.application.routes.draw do
  root 'variants#index' 
  resources :wishlists
  resources :variants
  resources :posts
  resources :reviews
  resources :carts
  resources :items
  devise_for :users, controllers: { registrations: 'registrations' }

  devise_scope :user do 
    get "/my_profile" => "registrations#show"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
