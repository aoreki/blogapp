class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      login(user)
      remember(user) if params[:session][:remember_me] == '1'
      redirect_to session[:forwarding_url] || user
      session.delete(:forwarding_url)
    else
      flash.now[:danger] = '用户名不存在或密码不正确'
      render 'new'
    end
  end

  def destroy
    if login?
      current_user.update_attribute(:remember_digest, nil)
      cookies.delete(:user_id)
      cookies.delete(:remember_token)
      session.delete(:user_id)
      current_user = nil
      redirect_to root_path
    end
  end
end
