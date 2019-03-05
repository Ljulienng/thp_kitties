Rails.application.routes.draw do
  devise_for :users, :controllers => {sessions: 'sessions', registrations: 'registrations'}

  resources :cart_products, only: [:create, :destroy]

  resources :products

  resources :carts, only: [:destroy, :create, :update, :index]

  resources :users do
      resources :carts, only: [:destroy, :create, :update, :show]
      resources :avatars, only: [:create]
      resources :carts, only: [:show]
      
  end

  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
