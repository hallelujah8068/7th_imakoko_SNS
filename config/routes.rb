Rails.application.routes.draw do
  devise_for :users
  
  root to: "posts#top"
  get 'comments', to: 'comments#index'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
end
