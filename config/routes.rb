Rails.application.routes.draw do
  devise_for :users
  root to: "users#show"
  get 'users/:id', to: 'users#show', as: :user
  get 'comments', to: 'comments#index'
  resources :comments
  resources :posts
  resources :users do
    member do
      post 'follow'
      delete 'unfollow'
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
end
