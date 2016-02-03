class AddLatitudeToWorkspaces < ActiveRecord::Migration
  def change
    add_column :workspaces, :latitude, :float
  end
end
