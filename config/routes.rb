Rails.application.routes.draw do
  devise_for :users
  
  # 開発者によって選択されたルートへの変更を適用
  # この例では、開発者が "posts#top" を選択
  root to: "posts#top"
  
  get 'comments', to: 'comments#index'
  resources :comments
  resources :posts
end