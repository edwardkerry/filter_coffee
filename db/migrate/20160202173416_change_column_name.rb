class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :workspaces, :rating, :overall_rating
  end
end
