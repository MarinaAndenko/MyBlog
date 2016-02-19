Rails.application.routes.draw do
  get 'posts/index'

  devise_for :users
  get 'home' => 'home#index', as: :home
  root to: 'home#index'
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  get 'admin_panel' => 'admin#index' , as: :admin
  get 'admin_panel/edit_user_role' => 'admin#edit_user_role'
  post 'admin_panel/edit_user_role' => 'admin#edit_user_role'
  #resources :blogs
  #get 'my_blogs' => 'blogs#my_blogs'

  #resources :users do
  #  resources :blogs do
  #    resources :posts do
  #    end 
  #  end
  #end
  #get 'user/:id(.:format)/blog' => 'blogs#index'

  resources :users do
    resources :blogs, only: [:index]
  end

  resources :blogs do
    resources :posts, only: [:new, :create]
  end 

  resources :blogs
  resources :posts

  
end
