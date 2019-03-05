Rails.application.routes.draw do

  devise_for :users, :controllers => {sessions: 'sessions', registrations: 'registrations'}  

  resources :products do
    resources :products_avatars, only: [:create]  
    resources :carts, only: [:destroy, :create, :update, :index]
  end
  resources :users do
      resources :carts, only: [:destroy, :create, :update, :show]
      resources :avatars, only: [:create]
  end

  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
