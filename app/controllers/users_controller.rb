class UsersController < ApplicationController
  #edit和update之前需要先login
  before_action :login_user,only:[:edit,:update]
  #只能修改自己的信息
  before_action :correct_user,only:[:edit,:update]
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
      login(@user)
  		redirect_to @user
  	else
  		render 'new'
  	end
  end
  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end
  def destroy
  end
  def index
     @users = User.all
  end

  private
	  def user_params
	  	params.require(:user).permit(:name, :email, :password, :password_confirmation)
	  end
    def login_user
      unless login?
        session[:forwarding_url] = request.original_url if request.get?
        flash[:danger] = 'Please Login First'
        redirect_to new_session_path
      end
    end
    def correct_user
      @user = User.find_by(id:params[:id])
      redirect_to user_path(@user) unless current_user == @user
    end
end
