Rails.application.routes.draw do
  devise_for :users
  get 'home' => 'home#index', :as => 'home'
  root to: 'home#index'
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  get 'admin_panel' => 'admin#index'
  get 'admin_panel/edit_user_role' => 'admin#edit_user_role'
  resources :admin
  post 'admin_panel/edit_user_role' => 'admin#update'
  resources :admin
end
