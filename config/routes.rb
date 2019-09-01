Rails.application.routes.draw do
  devise_for :users
  root 'mercari#index'  
  get '/mercari/logout', to: "mercari#logout", as: "mercari"
  resources :mercari
  resources :sell
  resources :users, only: [:show ,:index]
end


