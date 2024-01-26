Rails.application.routes.draw do
  devise_for :users
  root to: "users#show"
  get 'comments', to: 'comments#index'
  
  resources :users do
    member do
      get 'followings', to: 'follows#followings'
      get 'followers', to: 'follows#followers'
    end
  end


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
end
