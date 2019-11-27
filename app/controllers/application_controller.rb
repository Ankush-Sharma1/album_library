class ApplicationController < ActionController::Base
	before_action :authenticate_user!
  before_action :authenticate_access!
  skip_before_action :authenticate_access!, if: :devise_controller?
  # protect_from_forgery with: :exception


  # before_filter :configure_permitted_parameters, if: :devise_controller?
  # def after_sign_in_path_for(resource_or_scope)
  #   return redirect_to admin_dashboard_index_path
  # end
  # protected
  #   def configure_permitted_parameters
  #    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :role) }
  #    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :email, :password, :current_password) }
  #   end

  private
  def authenticate_access!
    if current_user.present? && current_user.role == "Admin"
      redirect_to admin_dashboard_index_path unless controller_path.start_with?("admin")
    else
      redirect_to albums_path if controller_path.start_with?("admin")
    end
  end
end
