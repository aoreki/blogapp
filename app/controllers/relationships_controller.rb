class RelationshipsController < ApplicationController
  before_action :login_user, only: %i[create destroy]
  def create
    @relationship = Relationship.new(
      follower_id: current_user.id,
      followed_id: params[:id]
    )
    redirect_to user_path(id: params[:id]) if @relationship.save
  end

  def destroy
    @relationship = Relationship.find_by(
      followed_id: params[:id],
      follower_id: current_user.id
    )
    @relationship.destroy
    redirect_to user_path(id: params[:id])
  end
end
