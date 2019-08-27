Rails.application.routes.draw do
  resources :comments
  devise_for :users
  root 'mercari#index'  
  resources :mercari 
end
