Rails.application.routes.draw do
  devise_for :users
  root to: "posts#top"

  resources :posts, only: [:create]

  resources :users do
    get 'followers', to: 'followers#index', on: :member
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
end
