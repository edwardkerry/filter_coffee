class WorkspacesController < ApplicationController

  def index
  end

  def new
    @workspace = Workspace.new
  end

  def create
    @workspace = Workspace.create(workspace_params)
    redirect_to "/workspaces"
  end

  def workspace_params
    params.require(:workspace).permit(:name)
  end

end
