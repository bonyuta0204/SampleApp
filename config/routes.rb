Rails.application.routes.draw do


  get 'sessions/new'

  get 'users/new'
  root 'static_pages#home'
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/signup', to: 'users#new'
  post '/signup',  to: 'users#create'
  get '/login',  to: 'sessions#new'
  post '/login',  to: 'sessions#create'
   resources :users
  resources :microposts, only: [:create, :destroy]
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :relationships, only: [:create, :destroy]
  resources :favorites, only: [:create, :destroy]

 delete '/logout',  to: 'sessions#destroy'
  resources :users do
    member do
      get :following, :followers
    end
  end

end
