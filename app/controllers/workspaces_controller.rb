class WorkspacesController < ApplicationController

  def index
    @workspace = Workspace.all
  end

  def new
    @workspace = Workspace.new
  end

  def create
    @workspace = Workspace.create(workspace_params)
    redirect_to "/workspaces"
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
    params.require(:workspace).permit(:name)
  end

end
