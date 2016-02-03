class AddAddressToWorkspaces < ActiveRecord::Migration
  def change
    add_column :workspaces, :address, :string
  end
end
