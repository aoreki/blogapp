Rails.application.routes.draw do
  root 'welcome#index'
  get '/logout',to:'sessions#destroy'
  get '/home',to:'welcome#home'
  get '/users/:id/follower',to:'users#follower'
  get '/users/:id/following',to:'users#following'
  resources :users
  resources :sessions
  resources :microposts,only:[:create,:destroy]
  resources :relationships,only:[:create,:destroy]
  resources :comments
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
