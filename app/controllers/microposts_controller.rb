class MicropostsController < ApplicationController
	before_action :login_user,only:[:create,:destroy]

	def create
		@micropost = current_user.microposts.build(micropost_params)
		if @micropost.save
			flash[:success] = "Micropost created!"
			redirect_to current_user
		else
			@user = current_user
			@microposts = @user.microposts.paginate(page:params[:page],per_page:10)
			render 'users/show'
		end
	end

	def destroy
		@micropost = current_user.microposts.find(params[:id])
		@micropost.destroy
		redirect_to current_user
	end
	private
		def micropost_params
			params.require(:micropost).permit(:content)
		end
end