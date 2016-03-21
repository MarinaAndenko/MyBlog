Rails.application.routes.draw do
  resources :blogs
  resources :posts
  devise_for :users
  get 'home' => 'home#index', as: :home
  root to: 'blogs#index'
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :users, only: [:show, :edit, :update], param: :username do
    member { get 'avatar' }
  end
    resources :comments, only: [:create, :destroy]
  get 'admin_panel' => 'admin#index' , as: :admin
  get 'admin_panel/edit_user_role' => 'admin#edit_user_role', as: 'admin/edit_user_role'
  post 'admin_panel/edit_user_role' => 'admin#edit_user_role'
end