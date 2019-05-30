class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    #strong parametersを設定し、usernameを許可
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation) }
    devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:name, :password, :password_confirmation) }
  end
	# def configure_permitted_parameters
	#    	devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
	# end

	def after_sign_in_path_for(resource)
	 	user_path(current_user)
	end

	def after_sign_up_path_for(resource)
	  	user_path(current_user)
	end
end
