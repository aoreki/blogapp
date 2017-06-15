class WelcomeController < ApplicationController
  def index; end

  def home
    @user = current_user
    if @user.nil?
      redirect_to welcome_index_path
      return
    end
    ids = @user.followings.pluck(:id)
    ids << current_user.id
    @micropost = @user.microposts.build
    @microposts = Micropost.where(user_id: ids).paginate(page: params[:page], per_page: 5)
  end
end
