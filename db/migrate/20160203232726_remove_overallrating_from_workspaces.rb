class RemoveOverallratingFromWorkspaces < ActiveRecord::Migration
  def change
    remove_column :workspaces, :overall_rating, :integer
  end
end
