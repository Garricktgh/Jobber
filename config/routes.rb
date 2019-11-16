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
  post '/messages/chat' => 'messages#chat'
  get '/messages/refresh' => 'messages#refresh'
  resources :messages, only: [:index, :create, :destroy]

end