module SessionsHelper
  def login(user)
    session[:user_id] = user.id
  end

  def current_user
    # temp
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    # forever
    elsif cookies.signed[:user_id]
      user = User.find_by(id: cookies.signed[:user_id])
      return unless user && user.authenticated?(cookies[:remember_token])
      login user
      @current_user = user
    end
  end

  def login?
    current_user
  end

  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end
end
