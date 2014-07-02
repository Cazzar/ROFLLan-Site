Rails.application.routes.draw do
  get 'about' => 'index#about'
  get 'contact' => 'index#contact'
  get 'sponsors' => 'index#sponsors'
  
  devise_for :users
  scope '/admin' do
  	resources :users
  end

  resources :lans
  get 'lans/:id/signup' => 'lans#signup', as: :lan_signup
  post 'lans/:id/signup' => 'lans#signup_complete', as: :lan_signup_complete
  get 'lans/:id/signups' => 'lans#signups', as: :lan_signups
  get 'lans/:id/remove_signup' => 'lans#remove_signup', as: :lan_remove_signup
  delete 'lans/:id/remove_signup' => 'lans#remove_signup_complete', as: :lan_remove_signup_complete

  resources :posts

  root 'index#index'
end
