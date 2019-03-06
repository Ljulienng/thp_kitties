Rails.application.routes.draw do

<<<<<<< HEAD
=======
  devise_for :users, :controllers => {sessions: 'sessions', registrations: 'registrations'}  
>>>>>>> 4f22553651d91465b4263d5a887349edb220ee6d


  resources :products, :path=> "cats" do
    resources :products_avatars, only: [:create]  
    resources :carts, only: [:destroy, :create, :update, :index]
  end
  resources :users, :path=> "friends" do
      resources :carts, only: [:destroy, :create, :update, :show]
      resources :avatars, only: [:create]
  end

  root 'home#index'
  get 'contact', to: 'home#contact'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
