Rails.application.routes.draw do
  devise_for :users
  root to: "posts#top"

  resources :posts, only: [:create]

  resources :users do
    get 'followers', to: 'followers#index', on: :member
  end

end
