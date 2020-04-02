Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'
  root 'welcome#index'
  get 'help/index'

  get '/about' => 'about#index'
  get '/holiday' => 'about#holiday'
  get '/history' => 'about#history'
  get '/priests' => 'about#priests'
  get '/schedule' => 'about#schedule'
  get '/admin' => 'admin#index'

  get '/admin/holiday' => 'admin#edit_holiday'
  post '/admin/holiday' => 'admin#update_holiday'
  get '/admin/history' => 'admin#edit_history'
  post '/admin/history' => 'admin#update_history'
  get '/admin/sm_about' => 'admin#edit_sm_about'
  post '/admin/sm_about' => 'admin#update_sm_about'
  get '/admin/priests' => 'admin#edit_priests'
  post '/admin/priests' => 'admin#update_priests'
  get '/admin/schedule' => 'admin#edit_schedule'
  post '/admin/schedule' => 'admin#update_schedule'
  get '/admin/announcement' => 'admin#edit_announcement'
  post '/admin/announcement' => 'admin#update_announcement'
  post '/admin/update_name' => 'admin#update_name'
  get '/admin/download_notes' => 'admin#download_notes'
  get '/admin/clear_notes' => 'admin#clear_notes'

  get 'questions/unanswered' => 'questions#unanswered'

  get 'notes' => 'notes#index'
  post 'notes' => 'notes#send_notes'
  get 'notes/success_page' => 'notes#success_page'

  resources :texts, only: [:show, :update]
  resources :posts
  resources :pictures, only: [:create, :destroy]
  resources :contacts, except: [:destroy, :show]
  resources :questions
end
