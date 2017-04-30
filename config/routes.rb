Rails.application.routes.draw do
  root 'welcome#index'
  get '/logout',to:'sessions#destroy'
  resources :articles do
  	resources :comments
  end
  resources :users
  resources :sessions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
