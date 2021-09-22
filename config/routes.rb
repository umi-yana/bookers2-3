Rails.application.routes.draw do

  devise_for :users

  resources :users,only: [:show,:index,:edit,:update]

  resources :books,only: [:show,:index,:create,:edit,:update,:destroy] do
   resource :favorites,only: [:create,:destroy]
  # いいね機能はbookに紐付く
  end

  root 'homes#top'
  get 'home/about' => 'homes#about'

end