Rails.application.routes.draw do


  devise_for :users, :controllers => {sessions: 'sessions', registrations: 'registrations', passwords: 'passwords'}

  resources :products, :path=> "cats" do
    resources :products_avatars, only: [:create]
  end

  resources :users, :path=> "friends", only: [:show, :edit, :update] do
      resources :avatars, only: [:create]
  end

  namespace :admins do
    resources :admin, only: [:index]
    resources :users
    resources :products
    root to: "admin#index"
  end

  resources :carts, only: [:destroy, :create, :update, :show]
  resources :orders,  only: [:index, :create]

  resources :cart_products
  root 'home#index'
  get 'contact', to: 'home#contact'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
