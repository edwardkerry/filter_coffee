class WorkspacesController < ApplicationController

  def index
    @workspace = Workspace.all
  end
end
