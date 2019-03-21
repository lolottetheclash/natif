Rails.application.routes.draw do


  root 'home#home'
  
  resources :variants, :path => "produits"
  resources :wishlists, :path => "ma_wishlist"

  resources :orders, :path => "mes_commandes"
  resources :items
  resources :options
  resources :option_values
  resources :option_associations

  resources :searches, :path => "recherches"
  
  devise_for :users,
    controllers: { registrations: 'registrations' },
    path: '',
    path_names: { sign_up: 'creer_un_compte', sign_in: 'identification', sign_out: 'deconnexion', password: 'mot_de_passe_oublie'}
  devise_scope :user do 
    get "/mon_profil" => "registrations#show"
  end
  
  get '/carts/payment' => 'carts#payment'
  resources :carts, :path => "mon_panier"
  get '/add_to_carts/:id' => 'carts#additem', as: 'addtocart'
  get '/remove_from_carts/:id' => 'carts#removeitem', as: 'removefromcart'
  resources :posts, :path => "blog"
  get "/postDashboard", to: "posts#postDashboard"
  get '/home/about_us', to: 'home#about_us', as: 'a_propos'

end
