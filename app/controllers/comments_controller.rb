class CommentsController < ApplicationController
  def index
    @micropost = Micropost.includes(:comments).find(params[:micropost_id])
    @comments = @micropost.comments.paginate(page: params[:page], per_page: 5)
    @comment = @micropost.comments.build
    render 'index', layout: false
  end

  def create
    @comment = Comment.create(comment_params)
    render 'comments/postcomment', layout: false if @comment.save
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id, :micropost_id)
  end
end
