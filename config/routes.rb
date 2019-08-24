Rails.application.routes.draw do
  root 'mercari#index'  
  resources :mercari 
end
