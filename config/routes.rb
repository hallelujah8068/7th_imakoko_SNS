Rails.application.routes.draw do
  devise_for :users
  root to: "posts#top"
  get 'comments', to: 'comments#index'
  get 'posts/load_more_tweets', to: 'posts#load_more_tweets' # 100件のツイートを取得用
  resources :comments
  resources :posts do
    collection do
      get :load_more_tweets
    end
  end
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