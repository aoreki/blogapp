class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def show
		@user = User.find(params[:id])
  	# debugger
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		flash[:success] = "Welcome to Hello,blog!"
  		redirect_to @user
  	else
  		render 'new'
  	end
  end

  private
	  def user_params
	  	params.require(:user).permit(:name, :email, :password, :password_confirmation)
	  end
end
