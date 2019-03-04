Rails.application.routes.draw do
  get 'products_avatars_controller/create'
  get 'products_avatars_controller/new'
  get 'avatars_controller/create'
  get 'avatars_controller/new'
  devise_for :users

  resources :products do
    resources :avatars, only: [:create]  
    resources :carts, only: [:destroy, :create, :update, :index]
  end
  resources :users, only: [:show] do
      resources :carts, only: [:destroy, :create, :update, :index]
      resources :avatars, only: [:create]
  end

  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
