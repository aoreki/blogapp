class UsersController < ApplicationController
  before_action :correct_user, only: %i[edit update]
  before_action :admin_user, only: [:destroy]
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page], per_page: 10)
    @micropost = @user.microposts.build
    # debugger
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
    @user = User.find_by(id: params[:id])
    redirect_to user_path(@user) unless current_user == @user
  end

  def admin_user
    redirect_to root_path unless current_user.admin?
  end
end
