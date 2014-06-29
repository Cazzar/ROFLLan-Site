Rails.application.routes.draw do
  get 'index/index'
  get 'index/about'
  get 'index/contact'
  get 'index/sponsors'

  get 'sessions/login'
  get 'sessions/home'
  get 'sessions/profile'
  get 'sessions/setting'
  post 'sessions/login' => 'sessions#login_attempt'

  get 'users/new'
  post 'users/create'
  
  resources :lans

  root 'index#index'
end
