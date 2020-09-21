Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
  	post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  root 'home#top'
  get 'home/about'
  resources :users, only: [:show, :index, :edit, :update]
  
  resources :books, except: [:new] do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
    put :sort
  end


end
