Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks',registrations: 'users/registrations' } 
  root 'mercari#index'  
  get 'mercari/logout', to: 'mercari#logout'
  resources :mercari
  # get 'sell/comfirm', to: 'sell#comfirm'
  resources :sell do
    member do
      get 'comfirm'
    end
  end  
  get 'signup/signup', to: 'signup#sign_up'
  get 'signup/phone', to: 'signup#phone'
  get 'signup/adress', to: 'signup#address'
  get 'signup/card', to: 'signup#card'
  get 'signup/complete', to: 'signup#complete'
  get 'mypage/card', to: 'mypage#card'
  get 'mypage/identification', to: 'mypage#info'
  get 'mypage/profile', to: 'mypage#profile'
  get 'mypage/list', to: 'mypage#list'
  resources :mypage
  resources :users, only: [:show ,:index]
  resources :items
  resources :card, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end
  resources :purchase, only: [:index] do
    member do
      get 'index', to: 'purchase#index'
      post 'pay', to: 'purchase#pay'
      get 'done', to: 'purchase#done'
    end
  end
end


