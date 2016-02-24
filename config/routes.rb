Rails.application.routes.draw do

  resources :comments
  resources :blogs
  resources :posts
  #resources :users, only: [:show, :edit, :update]
  #get 'profile' => 'users#show'
  #get 'profile/edit' => 'users#edit'
  #post 'profile/edit' => 'users#update'
  devise_for :users
  get 'home' => 'home#index', as: :home
  root to: 'blogs#index'
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :users, only: [:show, :edit, :update]
  get 'admin_panel' => 'admin#index' , as: :admin
  get 'admin_panel/edit_user_role' => 'admin#edit_user_role'
  post 'admin_panel/edit_user_role' => 'admin#edit_user_role'

  
end
