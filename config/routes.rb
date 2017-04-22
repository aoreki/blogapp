Rails.application.routes.draw do
  get 'users/new'

  get 'welcome/index'
  root 'welcome#index'
  resources :articles do
  	resources :comments
  end
  get '/signup',to:'users#new'
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
