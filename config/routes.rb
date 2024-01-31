Rails.application.routes.draw do
  devise_for :users
  
  # 開発者によって選択されたルートへの変更を適用
  # この例では、開発者が "posts#top" を選択
  root to: "posts#top"
  
  get 'comments', to: 'comments#index'
  resources :comments
  resources :posts
  resources :users, only: [:show] do
    member do
      post 'follow'
      delete 'unfollow'
      get 'followers', to: 'followers#index'
      get '/follows', to: 'follows#index' 
    end
    resources :follows, only: [:index], controller: 'follows'
  end
end