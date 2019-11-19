Rails.application.routes.draw do

  root 'landing_page#index'

  devise_for :companies

  devise_for :users

  resources :users

  resources :companies

  get '/posts/:id/suggestions' => 'posts#index', as: 'suggestion_post'
  get '/posts/new' => 'posts#new', as: 'new_post'
  post '/posts' => 'posts#create'
  get '/posts/:id' => 'posts#show' , as: 'post'
  get '/posts/:id/edit' => 'posts#edit', as: 'edit_post'
  patch '/posts/:id' => 'posts#update'
  delete '/posts/:id' => 'posts#destroy'

  resources :statuses, only: [:create, :destroy]

  get '/messages' => 'messages#index', as: 'messages'
  get '/messages/new/:post_id/:user_id' => 'messages#new', as: 'new_message'
  post '/messages' => 'messages#create'


end