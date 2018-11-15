class ApplicationController < ActionController::Base
	before_action :authenticate_user!
	protect_from_forgery with: :exception
	before_action :configure_permitted_parameters, if:  :devise_controller?

	protected				
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:ad_soyad, :username, :email, :password, :password_confirmation, :remember_me) }
		devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:ad_soyad, :username, :email, :password, :remember_me) }
		devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:ad_soyad,:username, :email, :password, :password_confirmation, :current_password) }
	end 
end
