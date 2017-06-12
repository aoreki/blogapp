class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception, prepend: true
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  private

  def login_user
    return if user_signed_in?
    session[:forwarding_url] = request.original_url if request.get?
    flash[:danger] = 'Please Login First'
    redirect_to new_user_session_path
  end
end
