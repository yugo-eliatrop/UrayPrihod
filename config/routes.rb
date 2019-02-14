Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'
  root 'welcome#index'
  get 'help/index'

  get '/about' => 'about#index'
  get '/holiday' => 'about#holiday'
  get '/history' => 'about#history'

  namespace :about do
    resources :priests, except: :show
  end
  
  resources :texts, only: [:show, :update]
  resources :posts
  resources :pictures, only: [:create, :destroy]
  resources :contacts, except: [:destroy, :show]
end
