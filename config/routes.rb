Rails.application.routes.draw do
  devise_for :users
  root to: "users#top"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: "users#top"
  # Defines the root path route ("/")
  # root "articles#index"
end
