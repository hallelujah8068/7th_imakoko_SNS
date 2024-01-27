Rails.application.routes.draw do
  devise_for :users
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
end
