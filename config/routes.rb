Rails.application.routes.draw do
  devise_for :users
  root 'homes#top'
  get '/search' => 'searches#search'
  
  resources :users,only: [:show,:index,:edit,:update] do
    resource :relationships,only: [:create, :destroy]
    get 'followings' => 'relationships#followinngs', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
end   
   
  resources :books,only: [:show,:index,:create,:edit,:update,:destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  get 'home/about' => 'homes#about'
end