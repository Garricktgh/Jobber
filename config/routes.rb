Rails.application.routes.draw do
  devise_for :companies
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :companies
  resources :posts
  resources :statueses
  resources :messages
end
