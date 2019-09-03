Rails.application.routes.draw do
  devise_for :users
  root 'mercari#index'  
  get '/mercari/logout', to: "mercari#logout", as: "mercari"
  resources :mercari
  resources :sell
  resources :users ,only: [:show]

  get 'signup/signup', to: 'signup#sign_up'
  get 'signup/phone', to: 'signup#phone'
  get 'signup/adress', to: 'signup#address'
  get 'signup/card', to: 'signup#card'
  get 'signup/complete', to: 'signup#complete'
end


