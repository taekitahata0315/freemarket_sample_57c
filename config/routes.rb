Rails.application.routes.draw do
  devise_for :users
  root 'mercari#index'  
  get 'mercari/logout', to: 'mercari#logout'
  resources :mercari
  resources :sell
  get 'signup/signup', to: 'signup#sign_up'
  get 'signup/phone', to: 'signup#phone'
  get 'signup/adress', to: 'signup#address'
  get 'signup/card', to: 'signup#card'
  get 'signup/complete', to: 'signup#complete'
  resources :mypage
  resources :users, only: [:show ,:index]
end


