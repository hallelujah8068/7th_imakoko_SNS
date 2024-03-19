Rails.application.routes.draw do
  get '/posts/load_more', to: 'posts#load_more', as: 'load_more'
  get '/posts/load_max', to: 'posts#load_max', as: 'load_max'
  devise_for :users
  root to: "posts#top"
  get 'comments', to: 'comments#index'

  resources :comments do
    resources :likes, only: [:create, :destroy] # コメントに関連付けられたいいね用のルートを追加
  end
  
  resources :posts,only: [:index, :show, :edit, :create, :destroy, :update] do
    resources :likes, only: [:create, :destroy] # 投稿に関連付けられたいいね用のルートを追加
  end

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
  get 'users', to: 'users#show'
end