class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def after_sign_in_path_for(resource)
  	admin_ao_dashboard_path
  end
  def after_sign_out_path_for(resource)
  	new_admin_session_path
  end
end
