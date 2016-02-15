class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
     u.permit(:username, :email, :password, :password_confirmation, :role) 
 	end
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:username, :password, :remember_me, :role) }
  end
end
