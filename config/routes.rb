Rails.application.routes.draw do
  get 'help/index'
  devise_for :users
  get 'welcome/index'
  root 'welcome#index'
  resources :posts
  resources :pictures, only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
