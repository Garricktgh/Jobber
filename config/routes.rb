Rails.application.routes.draw do
  devise_for :companies
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'landing_page#index'
  resources :users
  resources :companies
  resources :posts do
    resources :suggestions, only: [:index]
  end
  resources :statuses

  get '/messages' => 'messages#index', as: 'messages'
  get '/messages/new/:post_id/:user_id' => 'messages#new', as: 'new_message'
  post '/messages' => 'messages#create'

end