class WelcomeController < ApplicationController
  before_action :login_user,only:[:home]
  def index
  end
  def home
    @user = current_user
    ids = @user.followings.pluck(:id)
    ids << current_user.id
    @micropost = @user.microposts.build
    @microposts = Micropost.where(user_id: ids).paginate(page:params[:page],per_page:5)
  end
end
