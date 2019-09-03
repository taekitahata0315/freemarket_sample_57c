Rails.application.routes.draw do
  devise_for :users
  root 'mercari#index'  
  resources :mercari
  resources :sell
  resources :mypage
  resources :users, only: [:show ,:index]
end


