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

	def thumbup
		@micropost = Micropost.find(params[:id])
		num = @micropost.thumbup + 1
		@micropost.update_columns(thumbup:num)
		render nothing:true
	end

	private
		def micropost_params
			params.require(:micropost).permit(:content,:picture,:source_id)
		end
		def picture_size
			if picture.size > 5.megabytes
				errors.add(:picture, "should be less than 5MB")
			end
		end
end
