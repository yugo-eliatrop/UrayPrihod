Rails.application.routes.draw do
  get '/about' => 'about#index'
  get '/holiday' => 'about#holiday'
  get '/history' => 'about#history'

  namespace :about do
    resources :priests, except: :show
  end
  
  get 'help/index'
  devise_for :users
  get 'welcome/index'
  root 'welcome#index'
  resources :posts
  resources :pictures, only: [:create, :destroy]
  resources :contacts, except: [:destroy, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
