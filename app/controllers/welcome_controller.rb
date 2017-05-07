class WelcomeController < ApplicationController
  def index
  end
  def home
  	@user = current_user
  	@micropost = @user.microposts.build
  	@microposts = @user.microposts.paginate(page:params[:page],per_page:5)
  end
end
