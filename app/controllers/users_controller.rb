class UsersController < ApplicationController
  #edit和update之前需要先login
  before_action :login_user,only:[:edit,:update,:index,:destroy]
  #只能修改自己的信息
  before_action :correct_user,only:[:edit,:update]
  before_action :admin_user,only:[:destroy]
	def new
		@user = User.new
	end

	def show
		@user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page:params[:page],per_page:10)
    @micropost = @user.microposts.build
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
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end
  def index
     @users = User.paginate(page: params[:page])
  end

  def follower
    @users = User.find(params[:id]).followers.paginate(page: params[:page])
    render 'index'
  end

  def following
    @users = User.find(params[:id]).followings.paginate(page: params[:page])
    render 'index'
  end

  private

	  def user_params
	  	params.require(:user).permit(:name, :email, :password, :password_confirmation)
	  end

    def correct_user
      @user = User.find_by(id:params[:id])
      redirect_to user_path(@user) unless current_user == @user
    end

    def admin_user
      redirect_to root_path unless current_user.admin?
    end
end
