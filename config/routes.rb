Rails.application.routes.draw do
  devise_for :users
  root to: "users#show"
  get 'comments', to: 'comments#index'
  resources :comments
  resources :posts

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
end
