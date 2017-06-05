class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  private
  def login_user
    unless login?
      session[:forwarding_url] = request.original_url if request.get?
      flash[:danger] = 'Please Login First'
      redirect_to new_session_path
    end
  end
end
