class AddLongitudeToWorkspaces < ActiveRecord::Migration
  def change
    add_column :workspaces, :longitude, :float
  end
end
