class AddWorkspaceIdToRatings < ActiveRecord::Migration
  def change
    add_reference :ratings, :workspace, index: true, foreign_key: true
  end
end
