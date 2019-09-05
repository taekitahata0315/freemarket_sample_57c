Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks',registrations: 'users/registrations' }
  root 'mercari#index'  
  get 'mercari/logout', to: 'mercari#logout'
  resources :mercari
  get 'sell/comfirm', to: 'sell#comfirm'
  resources :sell
  get 'signup/signup', to: 'signup#sign_up'
  get 'signup/phone', to: 'signup#phone'
  get 'signup/adress', to: 'signup#address'
  get 'signup/card', to: 'signup#card'
  get 'signup/complete', to: 'signup#complete'
  get 'mypage/card', to: 'mypage#card'
  get 'mypage/identification', to: 'mypage#info'
  get 'mypage/profile', to: 'mypage#profile'
  resources :mypage
  resources :users, only: [:show ,:index]
end


