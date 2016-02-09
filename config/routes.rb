Rails.application.routes.draw do
  devise_for :users
  get 'home' => 'home#index', :as => 'home'
  root to: 'home#index'
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
end
