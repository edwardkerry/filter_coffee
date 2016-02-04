class RatingsController < ApplicationController
  def new
    @workspace = Workspace.find(params[:workspace_id])
    @rating = Rating.new
  end

  def create
    @workspace = Workspace.find(params[:workspace_id])
    @rating = @workspace.ratings.new(rating_params)

    unless @rating.save
      flash[:notice]= "You have already rated #{@workspace.name}"
    end

    redirect_to workspaces_path
  end

  def rating_params
    new_params = params.require(:rating).permit(:wifi, :seating, :outlets, :noise, :coffee)
    new_params[:user_id] = current_user.id
    new_params
  end
end
