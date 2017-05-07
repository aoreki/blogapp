Rails.application.routes.draw do
  root 'welcome#index'
  get '/logout',to:'sessions#destroy'
  get '/home',to:'welcome#home'
  resources :articles do
  	resources :comments
  end
  resources :users
  resources :sessions
  resources :microposts,only:[:create,:destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
