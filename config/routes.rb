Rails.application.routes.draw do
  get 'index/index'
  get 'index/about'
  get 'index/contact'
  get 'index/sponsors'
  
  devise_for :users
  scope "/admin" do
  	resources :users
  end

  resources :lans

  root 'index#index'
end
