Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'
  get '/home', to: 'welcome#home'

  resources :users, only: [:index] do
    member do
      get 'follower', 'following', 'show'
    end
  end

  resources :microposts, only: %i[create destroy] do
    member do
      get 'thumbup'
    end
  end
  resources :relationships, only: %i[create destroy]
  resources :comments, only: %i[index create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
