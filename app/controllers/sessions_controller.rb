class SessionsController < ApplicationController
  def new
  end
  def create
  	user = User.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
  		login(user)
  		redirect_to user
  	else
  		flash.now[:danger] = '用户名不存在或密码不正确' 
  		render 'new'
  	end
  end

  def destroy
  end
end
