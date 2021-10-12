Rails.application.routes.draw do
  devise_for :users
  root 'homes#top'
  
  resources :users,only: [:show,:index,:edit,:update]
  resources :books,only: [:show,:index,:create,:edit,:update,:destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  get 'home/about' => 'homes#about'
end