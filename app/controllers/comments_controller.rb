class CommentsController < ApplicationController
	def index
		@micropost = Micropost.find(params[:micropost_id])
		# @comments = @micropost.comments.paginate(page:params[:page],per_page:5)
		@comments = @micropost.comments.all
		# respond_to do |format|
		# 	format.html
		# 	format.xml {render}
		# end
		render 'index',layout:false
	end
end
