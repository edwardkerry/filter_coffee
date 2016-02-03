class RatingsController < ApplicationController
  def new
    @workspace = Workspace.find(params[:workspace_id])
    @rating = Rating.new
  end

  def create
    @workspace = Workspace.find(params[:workspace_id])
    @workspace.ratings.create(rating_params)

    redirect_to workspaces_path
  end

  def rating_params
    params.require(:rating).permit(:wifi, :seating, :outlets, :noise)
  end
end
