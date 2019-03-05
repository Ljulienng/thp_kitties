Rails.application.routes.draw do
<<<<<<< HEAD
  devise_for :users
=======
  devise_for :users, :controllers => {sessions: 'sessions', registrations: 'registrations'}  
>>>>>>> 62ad1b795ee410af8ef4a892074755668bb0d807

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
