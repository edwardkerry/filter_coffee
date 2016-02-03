require "rails_helper"

  def add_workspace
    visit "/workspaces"
    click_link "Add a workspace"
    fill_in "Name", with: "SecondHome"
    click_button "Create Workspace"
  end
