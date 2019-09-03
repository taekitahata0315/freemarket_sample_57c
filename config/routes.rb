Rails.application.routes.draw do
  devise_for :users
  root 'mercari#index'  
  get 'mercari/logout', to: 'mercari#logout'
  resources :mercari
  resources :sell
  resources :mypage
  resources :users, only: [:show ,:index]
end


