Rails.application.routes.draw do

  devise_for :users, :controllers => {sessions: 'sessions', registrations: 'registrations'}


  resources :products, :path=> "cats" do
    resources :products_avatars, only: [:create]
  end
  resources :users, :path=> "friends" do
      resources :avatars, only: [:create]
  end
  resources :carts, only: [:destroy, :create, :update, :show] do
    resources :orders
  end
  resources :cart_products
  root 'home#index'
  get 'contact', to: 'home#contact'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
