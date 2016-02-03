class WorkspacesController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @workspaces = Workspace.all
  end

  def new
    @workspace = Workspace.new
    @client = GooglePlaces::Client.new('AIzaSyAkk0WzkJl4oPNEYm6YbpXasQHRfHB3zSk')
    @spots = @client.spots(51.517912, -0.0737660)
  end

  def create
    byebug
    @workspace = Workspace.new(workspace_params)
    if @workspace.save
      redirect_to "/workspaces"
    else
      render "new"
    end
  end

  def show
    @workspace = Workspace.find(params[:id])
  end

  def edit
    @workspace = Workspace.find(params[:id])
  end

  def update
    @workspace = Workspace.find(params[:id])
    @workspace.update(workspace_params)
    flash[:notice] = "Edit successful"
    redirect_to workspace_path(@workspace)
  end

  def destroy
    @workspace = Workspace.find(params[:id])
    @workspace.destroy
    flash[:notice] = "Delete successful"
    redirect_to "/workspaces"
  end

  def workspace_params
    params.require(:workspace).permit(:name, :address, :latitude, :longitude)
  end

end
